/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
////  #if MYNEWT_VAL(TEMP_STM32_ONB)

#include <string.h>
#include "os/mynewt.h"
#include "console/console.h"
#include "sensor/sensor.h"
#include "sensor/temperature.h"
#include "stm32f1xx_hal_dma.h"
#include "stm32f1xx_hal_adc.h"
#include "adc_stm32f1/adc_stm32f1.h"
#include "temp_stm32/temp_stm32.h"

//  Exports for the sensor API
static int temp_stm32_sensor_read(struct sensor *, sensor_type_t, sensor_data_func_t, void *, uint32_t);
static int temp_stm32_sensor_get_config(struct sensor *, sensor_type_t, struct sensor_cfg *);

//  Global instance of the sensor driver
static const struct sensor_driver g_temp_stm32_sensor_driver = {
    temp_stm32_sensor_read,
    temp_stm32_sensor_get_config
};

//  Config for the temperature channel on ADC1.
static ADC_ChannelConfTypeDef temp_channel_config = {
    .Channel      = ADC_CHANNEL_TEMPSENSOR,      //  Channel number of temperature sensor on ADC1.  For Blue Pill: 16
    .Rank         = ADC_REGULAR_RANK_1,          //  Every ADC1 channel should be assigned a rank to indicate which channel gets converted first.  Rank 1 is the first to be converted.
    .SamplingTime = ADC_SAMPLETIME_239CYCLES_5,  //  Sampling time 239.5 ADC clock cycles. ADC clock (APB2/PCLK2) runs at 8 MHz
};

int temp_stm32_default_cfg(struct temp_stm32_cfg *cfg) {
    //  Return the default sensor configuration.
    memset(cfg, 0, sizeof(struct temp_stm32_cfg));  //  Zero the entire object.
    cfg->bc_s_mask = SENSOR_TYPE_ALL;  //  Return all sensor values, i.e. temperature.
    cfg->adc_dev_name = STM32F1_ADC1_DEVICE;    //  For STM32F1: adc1
    cfg->adc_channel = ADC_CHANNEL_TEMPSENSOR;  //  For STM32F1: 16
    cfg->adc_open_arg = NULL;
    cfg->adc_channel_cfg = &temp_channel_config;  //  Configure the temperature channel.
    return 0;
}

static int temp_stm32_open(struct os_dev *dev0, uint32_t timeout, void *arg) {
    //  Setup ADC channel configuration for temperature sensor.  Return 0 if successful.
    //  This locks the ADC channel until the sensor is closed.
    int rc = -1;
    struct temp_stm32 *dev;    
    struct temp_stm32_cfg *cfg;
    dev = (struct temp_stm32 *) dev0;  assert(dev);  
    cfg = &dev->cfg; assert(cfg); assert(cfg->adc_channel);  assert(cfg->adc_channel_cfg);  assert(cfg->adc_dev_name);

    //  Open port ADC1.
    dev->adc = (struct adc_dev *) os_dev_open(cfg->adc_dev_name, timeout, cfg->adc_open_arg);
    assert(dev->adc);
    if (!dev->adc) { goto err; }
    console_printf("open adc1 channel 16\n");  ////

    //  Configure port ADC1 channel 16 for temperature sensor.
    rc = adc_chan_config(dev->adc, cfg->adc_channel, cfg->adc_channel_cfg);
    if (rc) { 
        if (dev->adc) { os_dev_close((struct os_dev *) dev->adc); }
        goto err; 
    }
    return 0;
err:
    assert(rc == 0);
    return rc;
}

static int temp_stm32_close(struct os_dev *dev0) {
    //  Close the sensor.  This unlocks the ADC channel.  Return 0 if successful.
    //  console_printf("close adc1 channel 16\n");  ////
    struct temp_stm32 *dev;    
    dev = (struct temp_stm32 *) dev0;
    if (dev->adc) {
        //  Close port ADC1.
        os_dev_close((struct os_dev *) dev->adc);
        dev->adc = NULL;
    }
    return 0;
}

/**
 * Expects to be called back through os_dev_create().
 *
 * @param The device object associated with temp_stm32
 * @param Argument passed to OS device init, unused
 *
 * @return 0 on success, non-zero error on failure.
 */
int temp_stm32_init(struct os_dev *dev0, void *arg) {
    struct temp_stm32 *dev;
    struct sensor *sensor;
    int rc;
    if (!arg || !dev0) { rc = SYS_ENODEV; goto err; }
    dev = (struct temp_stm32 *) dev0;
    dev->adc = NULL;

    //  Get the default config.
    rc = temp_stm32_default_cfg(&dev->cfg);
    if (rc) { goto err; }

    //  Init the sensor.
    sensor = &dev->sensor;
    rc = sensor_init(sensor, dev0);
    if (rc != 0) { goto err; }

    //  Add the driver with all the supported sensor data types.
    rc = sensor_set_driver(sensor, SENSOR_TYPE_AMBIENT_TEMPERATURE,
        (struct sensor_driver *) &g_temp_stm32_sensor_driver);
    if (rc != 0) { goto err; }

    //  Set the interface.
    rc = sensor_set_interface(sensor, arg);
    if (rc) { goto err; }

    //  Register with the Sensor Manager.
    rc = sensor_mgr_register(sensor);
    if (rc != 0) { goto err; }

    //  Set the handlers for opening and closing the device.
    OS_DEV_SETHANDLERS(dev0, temp_stm32_open, temp_stm32_close);
    return (0);
err:
    return (rc);
}

static int temp_stm32_sensor_read(struct sensor *sensor, sensor_type_t type,
    sensor_data_func_t data_func, void *data_arg, uint32_t timeout) {
    //  Read the sensor values depending on the sensor types specified in the sensor config.
    union {  //  Union that represents all possible sensor values.
        struct sensor_temp_data std;  //  Temperature sensor value.
    } databuf;
    struct temp_stm32 *dev;
    int rc, rawtemp;
    float temp;

    //  We only allow reading of temperature values.
    if (!(type & SENSOR_TYPE_AMBIENT_TEMPERATURE)) { rc = SYS_EINVAL; goto err; }
    dev = (struct temp_stm32 *) SENSOR_GET_DEVICE(sensor); assert(dev);
    rawtemp = -1;
    {   //  Begin ADC Lock: Open and lock port ADC1, configure channel 16.
        rc = temp_stm32_open((struct os_dev *) dev, 0, NULL);
        if (rc) { goto err; }

        //  Get a new temperature sample from temperature sensor (channel 16 of port ADC1).
        rc = temp_stm32_get_raw_temperature(dev, 1, &rawtemp, NULL);

        temp_stm32_close((struct os_dev *) dev);
    }   //  End ADC Lock: Close and unlock port ADC1.
    if (rc) { goto err; }  //  console_printf("rawtemp: %d\n", rawtemp);  ////

    //  Convert the raw temperature to actual temperature.  From     //  See https://github.com/cnoviello/mastering-stm32/blob/master/nucleo-f446RE/src/ch12/main-ex1.c
    temp = ((float) rawtemp) / 4095.0 * 3300.0;
    temp = ((temp - 760.0) / 2.5) + 25.0;
    temp = temp / 10.0;

    //  Save the temperature.
    databuf.std.std_temp = temp;
    databuf.std.std_temp_is_valid = 1;  //  console_printf("temp: ");  console_printfloat(temp);  console_printf("\n");  ////
    
    if (data_func) {  //  Call the listener function to process the sensor data.
        rc = data_func(sensor, data_arg, &databuf.std, SENSOR_TYPE_AMBIENT_TEMPERATURE);
        if (rc) { goto err; }
    }
    return 0;
err:
    return rc;
}

/**
 * Get raw temperature from STM32 internal temperature sensor by reading from ADC. Will block until data is available.
 *
 * @param dev The temp_stm32 device
 * @param num_readings How many readings to take
 * @param temp_sum Pointer to an int. Will store the sum of the raw temperature readings. Each reading ranges from 0 to 4095.
 * @param temp_diff An array of (num_readings / 2) uint8_t. If non-null, will store the array of temperature differences between each reading and the last one.  Each byte in the array consists of two difference values, 4 bits each.
 *
 * @return 0 on success, and non-zero error code on failure
 */
int temp_stm32_get_raw_temperature(struct temp_stm32 *dev, int num_readings, int *temp_sum, uint8_t *temp_diff) {
    //  If adc_read_channel() fails to return a value, check that
    //  ExternalTrigConv is set to ADC_SOFTWARE_START for STM32F1.
    //  Also the STM32 HAL should be called in this sequence:
    //    __HAL_RCC_ADC1_CLK_ENABLE();
    //    HAL_ADC_Init(hadc1);
    //    HAL_ADC_ConfigChannel(hadc1, &temp_config);
    //    HAL_ADC_Start(hadc1);
    //    HAL_ADC_PollForConversion(hadc1, 10 * 1000);
    //    HAL_ADC_Stop(hadc1);
    //  See https://github.com/cnoviello/mastering-stm32/blob/master/nucleo-f446RE/src/ch12/main-ex1.c
    //  and https://os.mbed.com/users/hudakz/code/Internal_Temperature_F103RB/file/f5c604b5eceb/main.cpp/
    console_printf("read temp sensor\n");  ////
    int rc = 0, i, rawtemp, lasttemp = 0;
    uint8_t lastdiff = 0;
    assert(dev->adc);
    assert(temp_sum);
    *temp_sum = 0;

    for (i = 0; i < num_readings; i++) {
        rawtemp = -1;
        //  Block until the temperature is read from the ADC channel.
        rc = adc_read_channel(dev->adc, ADC_CHANNEL_TEMPSENSOR, &rawtemp);
        assert(rc == 0);
        if (rc) { goto err; }
        assert(rawtemp > 0);  //  If equals 0, it means we haven't sampled any values.  Check the above note.

        uint8_t diff = (rawtemp - lasttemp) & 0xf;  //  Diff between this and last reading, in 4 bits.
        if (i % 2 == 1) {
            uint8_t i2 = i >> 1;
            uint8_t b = diff + (lastdiff << 4);
            if (temp_diff) { temp_diff[i2] = b; }
            console_printf("%02x, %02x / ", i2, b);
        }
        temp_sum += rawtemp;
        lasttemp = rawtemp;
        lastdiff = diff;
    }
    console_printf("\n");  ////
    return 0;
err:
    return rc;
}

static int temp_stm32_sensor_get_config(struct sensor *sensor, sensor_type_t type,
    struct sensor_cfg *cfg) {
    //  Return the type of the sensor value returned by the sensor.
    int rc;
    if (!(type & SENSOR_TYPE_AMBIENT_TEMPERATURE)) {
        rc = SYS_EINVAL;
        goto err;
    }
    cfg->sc_valtype = SENSOR_VALUE_TYPE_FLOAT;  //  We return float.
    return (0);
err:
    return (rc);
}

/**
 * Configure STM32 internal temperature sensor
 *
 * @param Sensor device temp_stm32 structure
 * @param Sensor device temp_stm32_cfg config
 *
 * @return 0 on success, and non-zero error code on failure
 */
int temp_stm32_config(struct temp_stm32 *dev, struct temp_stm32_cfg *cfg) {
    struct sensor_itf *itf;
    int rc;
    itf = SENSOR_GET_ITF(&(dev->sensor)); assert(itf);
    rc = sensor_set_type_mask(&(dev->sensor),  cfg->bc_s_mask);
    if (rc) { goto err; }

    dev->cfg.bc_s_mask = cfg->bc_s_mask;
    return 0;
err:
    return (rc);
}

////  #endif  //  MYNEWT_VAL(TEMP_STM32_ONB)