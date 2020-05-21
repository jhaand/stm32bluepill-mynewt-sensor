In archive target/thumbv7m-none-eabi/debug/libmylib.rlib:

mylib-92127ab040a99ce6.1jnrofjtfbob7eun.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 1jnrofjtfbob7eun
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007b l       .debug_str	00000000 
00000081 l       .debug_str	00000000 
00000088 l       .debug_str	00000000 
0000009a l       .debug_str	00000000 
000000a9 l       .debug_str	00000000 
000000ad l       .debug_str	00000000 
000000b5 l       .debug_str	00000000 
000000b9 l       .debug_str	00000000 
000000bd l       .debug_str	00000000 
000000c7 l       .debug_str	00000000 
000000d1 l       .debug_str	00000000 
000000d7 l       .debug_str	00000000 
000000f3 l       .debug_str	00000000 
0000014c l       .debug_str	00000000 
00000153 l       .debug_str	00000000 
0000015b l       .debug_str	00000000 
0000016a l       .debug_str	00000000 
000001a2 l       .debug_str	00000000 
000001da l       .debug_str	00000000 
000001ec l       .debug_str	00000000 
00000228 l       .debug_str	00000000 
0000023e l       .debug_str	00000000 
00000247 l       .debug_str	00000000 
0000024f l       .debug_str	00000000 
00000254 l       .debug_str	00000000 
00000261 l       .debug_str	00000000 
00000000 l     O .rodata..L__unnamed_1	00000037 .L__unnamed_1
00000000 l     O .rodata..L__unnamed_2	00000010 .L__unnamed_2
00000000 l     O .data._ZN5mylib6sensor17LISTENER_INTERNAL17h8ac99cb3c7670450E	00000018 mylib::sensor::LISTENER_INTERNAL
00000000 l     F .text._ZN5mylib6sensor21null_sensor_data_func17hf765524a5784c82eE	0000001a mylib::sensor::null_sensor_data_func
00000000 l    d  .text._ZN5mylib6sensor17register_listener17h21cc6d7be1e0ead1E	00000000 .text._ZN5mylib6sensor17register_listener17h21cc6d7be1e0ead1E
00000000 l    d  .text._ZN5mylib6sensor21null_sensor_data_func17hf765524a5784c82eE	00000000 .text._ZN5mylib6sensor21null_sensor_data_func17hf765524a5784c82eE
00000000 l    d  .rodata..L__unnamed_3	00000000 .rodata..L__unnamed_3
00000000 l    d  .data._ZN5mylib6sensor17LISTENER_INTERNAL17h8ac99cb3c7670450E	00000000 .data._ZN5mylib6sensor17LISTENER_INTERNAL17h8ac99cb3c7670450E
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 core::panicking::panic
00000000 g     F .text._ZN5mylib6sensor17register_listener17h21cc6d7be1e0ead1E	00000070 .hidden mylib::sensor::register_listener
00000000         *UND*	00000000 sensor_register_listener



Disassembly of section .text._ZN5mylib6sensor17register_listener17h21cc6d7be1e0ead1E:

00000000 <mylib::sensor::register_listener>:
_ZN5mylib6sensor17register_listener17h21cc6d7be1e0ead1E():
/home/breetai/code/stm32bluepill-mynewt-sensor/src/sensor.rs:14
///  for the sensor listener structure.
///
///  `sensor`: The sensor to register a listener on.
///  `listener`: The listener to register onto the sensor.
///  Return 0 on success, non-zero error code on failure.
pub fn register_listener(sensor: SensorPtr, listener: SensorListener) -> i32 {    
   0:	b5f0      	push	{r4, r5, r6, r7, lr}
   2:	af03      	add	r7, sp, #12
   4:	f84d bd04 	str.w	fp, [sp, #-4]!
   8:	b08c      	sub	sp, #48	; 0x30
   a:	900b      	str	r0, [sp, #44]	; 0x2c
/home/breetai/code/stm32bluepill-mynewt-sensor/src/sensor.rs:15
    unsafe { assert!(LISTENER_INTERNAL.sl_sensor_type == 0) };  //  Make sure it's not used.
   c:	f240 0200 	movw	r2, #0
  10:	f2c0 0200 	movt	r2, #0
  14:	6813      	ldr	r3, [r2, #0]
  16:	6852      	ldr	r2, [r2, #4]
  18:	431a      	orrs	r2, r3
  1a:	2a00      	cmp	r2, #0
  1c:	9103      	str	r1, [sp, #12]
  1e:	9002      	str	r0, [sp, #8]
  20:	d115      	bne.n	4e <mylib::sensor::register_listener+0x4e>
  22:	e7ff      	b.n	24 <mylib::sensor::register_listener+0x24>
  24:	a804      	add	r0, sp, #16
/home/breetai/code/stm32bluepill-mynewt-sensor/src/sensor.rs:17
    //  Copy the caller's listener to the internal listener.
    unsafe { LISTENER_INTERNAL = listener };
  26:	9903      	ldr	r1, [sp, #12]
  28:	4602      	mov	r2, r0
  2a:	e891 5078 	ldmia.w	r1, {r3, r4, r5, r6, ip, lr}
  2e:	e882 5078 	stmia.w	r2, {r3, r4, r5, r6, ip, lr}
  32:	f240 0100 	movw	r1, #0
  36:	f2c0 0100 	movt	r1, #0
  3a:	460a      	mov	r2, r1
  3c:	e890 5078 	ldmia.w	r0, {r3, r4, r5, r6, ip, lr}
  40:	e882 5078 	stmia.w	r2, {r3, r4, r5, r6, ip, lr}
/home/breetai/code/stm32bluepill-mynewt-sensor/src/sensor.rs:19
    //  Pass the internal listener to the unsafe Mynewt API.
    unsafe { sensor_register_listener(sensor, &mut LISTENER_INTERNAL) }
  44:	9802      	ldr	r0, [sp, #8]
  46:	f7ff fffe 	bl	0 <sensor_register_listener>
  4a:	9001      	str	r0, [sp, #4]
  4c:	e00b      	b.n	66 <mylib::sensor::register_listener+0x66>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/sensor.rs:15
    unsafe { assert!(LISTENER_INTERNAL.sl_sensor_type == 0) };  //  Make sure it's not used.
  4e:	f240 0000 	movw	r0, #0
  52:	f2c0 0000 	movt	r0, #0
  56:	f240 0200 	movw	r2, #0
  5a:	f2c0 0200 	movt	r2, #0
  5e:	2137      	movs	r1, #55	; 0x37
  60:	f7ff fffe 	bl	0 <core::panicking::panic>
  64:	defe      	udf	#254	; 0xfe
/home/breetai/code/stm32bluepill-mynewt-sensor/src/sensor.rs:20
}
  66:	9801      	ldr	r0, [sp, #4]
  68:	b00c      	add	sp, #48	; 0x30
  6a:	f85d bb04 	ldr.w	fp, [sp], #4
  6e:	bdf0      	pop	{r4, r5, r6, r7, pc}

Disassembly of section .text._ZN5mylib6sensor21null_sensor_data_func17hf765524a5784c82eE:

00000000 <mylib::sensor::null_sensor_data_func>:
_ZN5mylib6sensor21null_sensor_data_func17hf765524a5784c82eE():
/home/breetai/code/stm32bluepill-mynewt-sensor/src/sensor.rs:33
    sl_arg        : 0,
    sl_next       : 0,
};

///  Define a dummy sensor data function in case there is none.
extern fn null_sensor_data_func(_sensor: SensorPtr, _arg: SensorArg, _sensor_data: SensorDataPtr, _sensor_type: SensorType) -> i32 { 0 }
   0:	b086      	sub	sp, #24
   2:	9b07      	ldr	r3, [sp, #28]
   4:	f8dd c018 	ldr.w	ip, [sp, #24]
   8:	9001      	str	r0, [sp, #4]
   a:	9102      	str	r1, [sp, #8]
   c:	9203      	str	r2, [sp, #12]
   e:	9305      	str	r3, [sp, #20]
  10:	f8cd c010 	str.w	ip, [sp, #16]
  14:	2000      	movs	r0, #0
  16:	b006      	add	sp, #24
  18:	4770      	bx	lr

mylib-92127ab040a99ce6.2oxmmplhbrhxfx84.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 2oxmmplhbrhxfx84
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007b l       .debug_str	00000000 
00000080 l       .debug_str	00000000 
00000084 l       .debug_str	00000000 
0000008d l       .debug_str	00000000 
000000ce l       .debug_str	00000000 
000000d7 l       .debug_str	00000000 
000000e0 l       .debug_str	00000000 
000000e3 l       .debug_str	00000000 
000000ed l       .debug_str	00000000 
000000f4 l       .debug_str	00000000 
000000fa l       .debug_str	00000000 
00000100 l       .debug_str	00000000 
00000105 l       .debug_str	00000000 
0000010a l       .debug_str	00000000 
00000146 l       .debug_str	00000000 
0000014a l       .debug_str	00000000 
00000189 l       .debug_str	00000000 
00000000 l    d  .text._ZN4core3str21_$LT$impl$u20$str$GT$3len17h3332595ef3754db0E	00000000 .text._ZN4core3str21_$LT$impl$u20$str$GT$3len17h3332595ef3754db0E
00000000 l    d  .text._ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17h9ed92de982a2fa5aE	00000000 .text._ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17h9ed92de982a2fa5aE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN4core3str21_$LT$impl$u20$str$GT$3len17h3332595ef3754db0E	0000002e .hidden core::str::<impl str>::len
00000000 g     F .text._ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17h9ed92de982a2fa5aE	0000000a .hidden core::str::<impl str>::as_ptr
00000000         *UND*	00000000 core::slice::<impl [T]>::len



Disassembly of section .text._ZN4core3str21_$LT$impl$u20$str$GT$3len17h3332595ef3754db0E:

00000000 <core::str::<impl str>::len>:
_ZN4core3str21_$LT$impl$u20$str$GT$3len17h3332595ef3754db0E():
/home/breetai/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/libcore/str/mod.rs:2249
    /// assert_eq!("ƒoo".chars().count(), 3);
    /// ```
    #[stable(feature = "rust1", since = "1.0.0")]
    #[rustc_const_stable(feature = "const_str_len", since = "1.32.0")]
    #[inline]
    pub const fn len(&self) -> usize {
   0:	b580      	push	{r7, lr}
   2:	466f      	mov	r7, sp
   4:	b08a      	sub	sp, #40	; 0x28
   6:	9004      	str	r0, [sp, #16]
   8:	9105      	str	r1, [sp, #20]
   a:	9008      	str	r0, [sp, #32]
   c:	9109      	str	r1, [sp, #36]	; 0x24
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17h8a83bc8a97c5efcbE():
/home/breetai/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/libcore/str/mod.rs:2338
        union Slices<'a> {
            str: &'a str,
            slice: &'a [u8],
        }
        // SAFETY: const sound because we transmute two types with the same layout
        unsafe { Slices { str: self }.slice }
   e:	9006      	str	r0, [sp, #24]
  10:	9107      	str	r1, [sp, #28]
  12:	9806      	ldr	r0, [sp, #24]
  14:	9907      	ldr	r1, [sp, #28]
_ZN4core3str21_$LT$impl$u20$str$GT$3len17h3332595ef3754db0E():
/home/breetai/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/libcore/str/mod.rs:2250
        self.as_bytes().len()
  16:	9003      	str	r0, [sp, #12]
  18:	9102      	str	r1, [sp, #8]
  1a:	e7ff      	b.n	1c <core::str::<impl str>::len+0x1c>
  1c:	9803      	ldr	r0, [sp, #12]
  1e:	9902      	ldr	r1, [sp, #8]
  20:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::len>
  24:	9001      	str	r0, [sp, #4]
  26:	e7ff      	b.n	28 <core::str::<impl str>::len+0x28>
/home/breetai/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/libcore/str/mod.rs:2251
    }
  28:	9801      	ldr	r0, [sp, #4]
  2a:	b00a      	add	sp, #40	; 0x28
  2c:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17h9ed92de982a2fa5aE:

00000000 <core::str::<impl str>::as_ptr>:
_ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17h9ed92de982a2fa5aE():
/home/breetai/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/libcore/str/mod.rs:2403
    /// let ptr = s.as_ptr();
    /// ```
    #[stable(feature = "rust1", since = "1.0.0")]
    #[rustc_const_stable(feature = "rustc_str_as_ptr", since = "1.32.0")]
    #[inline]
    pub const fn as_ptr(&self) -> *const u8 {
   0:	b082      	sub	sp, #8
   2:	9000      	str	r0, [sp, #0]
   4:	9101      	str	r1, [sp, #4]
/home/breetai/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/libcore/str/mod.rs:2405
        self as *const str as *const u8
    }
   6:	b002      	add	sp, #8
   8:	4770      	bx	lr

mylib-92127ab040a99ce6.3kjv3f2vcmjxzvqg.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3kjv3f2vcmjxzvqg
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007b l       .debug_str	00000000 
00000081 l       .debug_str	00000000 
00000086 l       .debug_str	00000000 
000000b8 l       .debug_str	00000000 
000000c6 l       .debug_str	00000000 
000000ca l       .debug_str	00000000 
000000d3 l       .debug_str	00000000 
000000d6 l       .debug_str	00000000 
000000e0 l       .debug_str	00000000 
000000e7 l       .debug_str	00000000 
000000ed l       .debug_str	00000000 
000000f3 l       .debug_str	00000000 
00000000 l    d  .text._ZN5mylib4base13console_print17hfeab557eda9d82cfE	00000000 .text._ZN5mylib4base13console_print17hfeab557eda9d82cfE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 core::slice::<impl [T]>::len
00000000         *UND*	00000000 core::slice::<impl [T]>::as_ptr
00000000 g     F .text._ZN5mylib4base13console_print17hfeab557eda9d82cfE	0000003a .hidden mylib::base::console_print
00000000         *UND*	00000000 console_buffer
00000000         *UND*	00000000 console_flush



Disassembly of section .text._ZN5mylib4base13console_print17hfeab557eda9d82cfE:

00000000 <mylib::base::console_print>:
_ZN5mylib4base13console_print17hfeab557eda9d82cfE():
/home/breetai/code/stm32bluepill-mynewt-sensor/src/base.rs:7

use cty::*;            //  Import string utilities from cty library: https://crates.io/crates/cty
use crate::sensor::*;  //  Import sensor.rs for Mynewt Sensor API

///  Display message `msg` on the Arm Semihosting console (via OpenOCD).
pub fn console_print(msg: &[u8]) {
   0:	b580      	push	{r7, lr}
   2:	466f      	mov	r7, sp
   4:	b088      	sub	sp, #32
   6:	9005      	str	r0, [sp, #20]
   8:	9106      	str	r1, [sp, #24]
/home/breetai/code/stm32bluepill-mynewt-sensor/src/base.rs:8
    let len = msg.len();
   a:	9004      	str	r0, [sp, #16]
   c:	9103      	str	r1, [sp, #12]
   e:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::len>
  12:	4601      	mov	r1, r0
  14:	9007      	str	r0, [sp, #28]
  16:	9102      	str	r1, [sp, #8]
  18:	e7ff      	b.n	1a <mylib::base::console_print+0x1a>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/base.rs:11
    unsafe {
        //  Call the Semihosting Console API, which is unsafe.
        console_buffer(msg.as_ptr(), len as u32);
  1a:	9804      	ldr	r0, [sp, #16]
  1c:	9903      	ldr	r1, [sp, #12]
  1e:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::as_ptr>
  22:	9001      	str	r0, [sp, #4]
  24:	e7ff      	b.n	26 <mylib::base::console_print+0x26>
  26:	9801      	ldr	r0, [sp, #4]
  28:	9902      	ldr	r1, [sp, #8]
  2a:	f7ff fffe 	bl	0 <console_buffer>
  2e:	e7ff      	b.n	2 <console_flush+0x2>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/base.rs:12
        console_flush();  //  TODO: Remove this.
  30:	f7ff fffe 	bl	0 <console_flush>
  34:	e7ff      	b.n	36 <mylib::base::console_print+0x36>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/base.rs:14
    }
}
  36:	b008      	add	sp, #32
  38:	bd80      	pop	{r7, pc}

mylib-92127ab040a99ce6.3mz5rljxhwadhwv4.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3mz5rljxhwadhwv4
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007b l       .debug_str	00000000 
00000080 l       .debug_str	00000000 
00000084 l       .debug_str	00000000 
00000087 l       .debug_str	00000000 
0000008a l       .debug_str	00000000 
0000008d l       .debug_str	00000000 
00000092 l       .debug_str	00000000 
00000098 l       .debug_str	00000000 
0000009f l       .debug_str	00000000 
000000a7 l       .debug_str	00000000 
000000b1 l       .debug_str	00000000 
000000b8 l       .debug_str	00000000 
000000bb l       .debug_str	00000000 
000000bf l       .debug_str	00000000 
000000c6 l       .debug_str	00000000 
000000cc l       .debug_str	00000000 
000000d5 l       .debug_str	00000000 
000000d9 l       .debug_str	00000000 
00000103 l       .debug_str	00000000 
00000108 l       .debug_str	00000000 
0000010d l       .debug_str	00000000 
0000011f l       .debug_str	00000000 
00000125 l       .debug_str	00000000 
00000128 l       .debug_str	00000000 
0000012c l       .debug_str	00000000 
00000131 l       .debug_str	00000000 
00000139 l       .debug_str	00000000 
0000013d l       .debug_str	00000000 
00000145 l       .debug_str	00000000 
0000014d l       .debug_str	00000000 
00000154 l       .debug_str	00000000 
0000015a l       .debug_str	00000000 
0000016e l       .debug_str	00000000 
0000017a l       .debug_str	00000000 
0000017f l       .debug_str	00000000 
00000187 l       .debug_str	00000000 
0000018e l       .debug_str	00000000 
00000192 l       .debug_str	00000000 
00000197 l       .debug_str	00000000 
0000019e l       .debug_str	00000000 
000001a7 l       .debug_str	00000000 
000001b1 l       .debug_str	00000000 
000001b8 l       .debug_str	00000000 
000001bd l       .debug_str	00000000 
000001c9 l       .debug_str	00000000 
000001d1 l       .debug_str	00000000 
000001da l       .debug_str	00000000 
000001e1 l       .debug_str	00000000 
000001e6 l       .debug_str	00000000 
000001eb l       .debug_str	00000000 
000001f1 l       .debug_str	00000000 
000001f7 l       .debug_str	00000000 
00000201 l       .debug_str	00000000 
00000204 l       .debug_str	00000000 
00000208 l       .debug_str	00000000 
0000020e l       .debug_str	00000000 
00000216 l       .debug_str	00000000 
0000021c l       .debug_str	00000000 
00000222 l       .debug_str	00000000 
0000022d l       .debug_str	00000000 
00000236 l       .debug_str	00000000 
00000259 l       .debug_str	00000000 
00000278 l       .debug_str	00000000 
0000027a l       .debug_str	00000000 
0000027f l       .debug_str	00000000 
000002a6 l       .debug_str	00000000 
000002ab l       .debug_str	00000000 
000002b1 l       .debug_str	00000000 
000002b8 l       .debug_str	00000000 
000002cd l       .debug_str	00000000 
000002d7 l       .debug_str	00000000 
000002e5 l       .debug_str	00000000 
000002e9 l       .debug_str	00000000 
000002f4 l       .debug_str	00000000 
000002fe l       .debug_str	00000000 
00000318 l       .debug_str	00000000 
0000037a l       .debug_str	00000000 
00000385 l       .debug_str	00000000 
000003a2 l       .debug_str	00000000 
000003bb l       .debug_str	00000000 
000003c5 l       .debug_str	00000000 
000003db l       .debug_str	00000000 
000003f9 l       .debug_str	00000000 
00000402 l       .debug_str	00000000 
00000407 l       .debug_str	00000000 
0000040c l       .debug_str	00000000 
00000410 l       .debug_str	00000000 
00000419 l       .debug_str	00000000 
00000430 l       .debug_str	00000000 
0000043a l       .debug_str	00000000 
00000000 l     O .rodata..L__unnamed_1	00000019 .L__unnamed_1
00000000 l     O .rodata..L__unnamed_2	00000010 .L__unnamed_2
00000000 l     O .rodata..L__unnamed_3	00000010 .L__unnamed_3
00000000 l     O .rodata..L__unnamed_4	00000012 .L__unnamed_4
00000000 l     O .rodata..L__unnamed_5	00000009 .L__unnamed_5
00000000 l     O .rodata.cst8	00000008 .L__unnamed_6
00000000 l     O .rodata..L__unnamed_7	00000001 .L__unnamed_7
00000000 l    d  .text.main	00000000 .text.main
00000000 l    d  .text.rust_begin_unwind	00000000 .text.rust_begin_unwind
00000000 l    d  .rodata..L__unnamed_8	00000000 .rodata..L__unnamed_8
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 .hidden core::str::<impl str>::len
00000000         *UND*	00000000 .hidden core::str::<impl str>::as_ptr
00000000         *UND*	00000000 core::panic::Location::file
00000000         *UND*	00000000 core::panic::Location::line
00000000         *UND*	00000000 core::panic::PanicInfo::location
00000000         *UND*	00000000 core::panicking::panic
00000000         *UND*	00000000 .hidden mylib::listen_sensor::start_sensor_listener
00000000         *UND*	00000000 .hidden mylib::base::console_print
00000000         *UND*	00000000 .hidden mylib::send_coap::start_network_task
00000000         *UND*	00000000 __bkpt
00000000         *UND*	00000000 console_buffer
00000000         *UND*	00000000 console_flush
00000000         *UND*	00000000 console_printhex
00000000 g     F .text.main	0000007e main
00000000         *UND*	00000000 os_eventq_dflt_get
00000000         *UND*	00000000 os_eventq_run
00000000 g     F .text.rust_begin_unwind	000000c2 rust_begin_unwind
00000000         *UND*	00000000 rust_sysinit



Disassembly of section .text.main:

00000000 <main>:
main():
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:23
use crate::listen_sensor::*;    //  Import listen_sensor.rs for polling the temperature sensor
use crate::send_coap::*;        //  Import send_coap.rs for sending sensor data

///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]                     //  Don't mangle the name "main"
pub extern "C" fn main() -> ! {  //  Declare extern "C" because it will be called by Mynewt
   0:	b580      	push	{r7, lr}
   2:	466f      	mov	r7, sp
   4:	b086      	sub	sp, #24
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:25
    //  Init Mynewt system.
    unsafe { rust_sysinit()  };
   6:	f7ff fffe 	bl	0 <rust_sysinit>
   a:	e7ff      	b.n	2 <console_flush+0x2>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:26
    unsafe { console_flush() };
   c:	f7ff fffe 	bl	0 <console_flush>
  10:	e7ff      	b.n	2 <mylib::send_coap::start_network_task+0x2>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:31

    //  Start the Network Task in the background.  The Network Task prepares the ESP8266 or nRF24L01 transceiver for
    //  sending CoAP messages.  We connect the ESP8266 to the WiFi access point and register
    //  the ESP8266/nRF24L01 driver as the network transport for CoAP.  Also perform WiFi Geolocation if it is enabled.
    let rc = start_network_task();  assert!(rc == 0);
  12:	f7ff fffe 	bl	0 <mylib::send_coap::start_network_task>
  16:	4601      	mov	r1, r0
  18:	9004      	str	r0, [sp, #16]
  1a:	9103      	str	r1, [sp, #12]
  1c:	e7ff      	b.n	1e <main+0x1e>
  1e:	9803      	ldr	r0, [sp, #12]
  20:	2800      	cmp	r0, #0
  22:	d106      	bne.n	32 <main+0x32>
  24:	e7ff      	b.n	26 <main+0x26>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:36

    //  Starting polling the temperature sensor every 10 seconds in the background.  
    //  After polling the sensor, call the listener function to send the sensor data to the CoAP server or Collector Node.
    //  If this is the Collector Node, we shall wait for sensor data from the Sensor Nodes and transmit to the CoAP server.
    let rc = start_sensor_listener();  assert!(rc == 0);
  26:	f7ff fffe 	bl	0 <mylib::listen_sensor::start_sensor_listener>
  2a:	4601      	mov	r1, r0
  2c:	9005      	str	r0, [sp, #20]
  2e:	9102      	str	r1, [sp, #8]
  30:	e00b      	b.n	4a <main+0x4a>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:31
    let rc = start_network_task();  assert!(rc == 0);
  32:	f240 0000 	movw	r0, #0
  36:	f2c0 0000 	movt	r0, #0
  3a:	f240 0200 	movw	r2, #0
  3e:	f2c0 0200 	movt	r2, #0
  42:	2119      	movs	r1, #25
  44:	f7ff fffe 	bl	0 <core::panicking::panic>
  48:	defe      	udf	#254	; 0xfe
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:36
    let rc = start_sensor_listener();  assert!(rc == 0);
  4a:	9802      	ldr	r0, [sp, #8]
  4c:	2800      	cmp	r0, #0
  4e:	d101      	bne.n	54 <main+0x54>
  50:	e7ff      	b.n	52 <main+0x52>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:39

    //  Main event loop
    loop {                            //  Loop forever...
  52:	e00b      	b.n	6c <main+0x6c>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:36
    let rc = start_sensor_listener();  assert!(rc == 0);
  54:	f240 0000 	movw	r0, #0
  58:	f2c0 0000 	movt	r0, #0
  5c:	f240 0200 	movw	r2, #0
  60:	f2c0 0200 	movt	r2, #0
  64:	2119      	movs	r1, #25
  66:	f7ff fffe 	bl	0 <core::panicking::panic>
  6a:	defe      	udf	#254	; 0xfe
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:42
        unsafe {
            os_eventq_run(            //  Process events...
                os_eventq_dflt_get()  //  From default event queue.
  6c:	f7ff fffe 	bl	0 <os_eventq_dflt_get>
  70:	9001      	str	r0, [sp, #4]
  72:	e7ff      	b.n	74 <main+0x74>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:41
            os_eventq_run(            //  Process events...
  74:	9801      	ldr	r0, [sp, #4]
  76:	f7ff fffe 	bl	0 <os_eventq_run>
  7a:	e7ff      	b.n	7c <main+0x7c>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:39
    loop {                            //  Loop forever...
  7c:	e7f6      	b.n	6c <main+0x6c>

Disassembly of section .text.rust_begin_unwind:

00000000 <rust_begin_unwind>:
rust_begin_unwind():
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:51
    //  Never comes here.
}

///  This function is called on panic, like an assertion failure. We display the filename and line number and pause in the debugger. From https://os.phil-opp.com/freestanding-rust-binary/
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
   0:	b580      	push	{r7, lr}
   2:	466f      	mov	r7, sp
   4:	b08e      	sub	sp, #56	; 0x38
   6:	9009      	str	r0, [sp, #36]	; 0x24
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:53
    //  Display the filename and line number to the Semihosting Console.
    if let Some(location) = info.location() {
   8:	f7ff fffe 	bl	0 <core::panic::PanicInfo::location>
   c:	9008      	str	r0, [sp, #32]
   e:	e7ff      	b.n	10 <rust_begin_unwind+0x10>
  10:	9808      	ldr	r0, [sp, #32]
  12:	2800      	cmp	r0, #0
  14:	d108      	bne.n	28 <rust_begin_unwind+0x28>
  16:	e7ff      	b.n	18 <rust_begin_unwind+0x18>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:63
        console_print(b" line 0x");
        unsafe { console_printhex(line as u8) }  //  TODO: Print in decimal not hex. Allow more than 255 lines.
        console_print(b"\n");
        unsafe { console_flush() }
    } else {
        console_print(b"panic unknown loc\n");
  18:	f240 0000 	movw	r0, #0
  1c:	f2c0 0000 	movt	r0, #0
  20:	2112      	movs	r1, #18
  22:	f7ff fffe 	bl	0 <mylib::base::console_print>
  26:	e044      	b.n	b2 <rust_begin_unwind+0xb2>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:53
    if let Some(location) = info.location() {
  28:	9808      	ldr	r0, [sp, #32]
  2a:	900a      	str	r0, [sp, #40]	; 0x28
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:54
        let file = location.file();
  2c:	9006      	str	r0, [sp, #24]
  2e:	f7ff fffe 	bl	0 <core::panic::Location::file>
  32:	4602      	mov	r2, r0
  34:	460b      	mov	r3, r1
  36:	900b      	str	r0, [sp, #44]	; 0x2c
  38:	910c      	str	r1, [sp, #48]	; 0x30
  3a:	9205      	str	r2, [sp, #20]
  3c:	9304      	str	r3, [sp, #16]
  3e:	e7ff      	b.n	40 <rust_begin_unwind+0x40>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:55
        let line = location.line();
  40:	9806      	ldr	r0, [sp, #24]
  42:	f7ff fffe 	bl	0 <core::panic::Location::line>
  46:	4601      	mov	r1, r0
  48:	900d      	str	r0, [sp, #52]	; 0x34
  4a:	9103      	str	r1, [sp, #12]
  4c:	e7ff      	b.n	4e <rust_begin_unwind+0x4e>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:56
        console_print(b"panic at ");
  4e:	f240 0000 	movw	r0, #0
  52:	f2c0 0000 	movt	r0, #0
  56:	2109      	movs	r1, #9
  58:	f7ff fffe 	bl	0 <mylib::base::console_print>
  5c:	e7ff      	b.n	5e <rust_begin_unwind+0x5e>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:57
        unsafe { console_buffer(file.as_ptr(), file.len() as u32) }
  5e:	9805      	ldr	r0, [sp, #20]
  60:	9904      	ldr	r1, [sp, #16]
  62:	f7ff fffe 	bl	0 <core::str::<impl str>::as_ptr>
  66:	9002      	str	r0, [sp, #8]
  68:	e7ff      	b.n	6a <rust_begin_unwind+0x6a>
  6a:	9805      	ldr	r0, [sp, #20]
  6c:	9904      	ldr	r1, [sp, #16]
  6e:	f7ff fffe 	bl	0 <core::str::<impl str>::len>
  72:	9001      	str	r0, [sp, #4]
  74:	e7ff      	b.n	76 <rust_begin_unwind+0x76>
  76:	9802      	ldr	r0, [sp, #8]
  78:	9901      	ldr	r1, [sp, #4]
  7a:	f7ff fffe 	bl	0 <console_buffer>
  7e:	e7ff      	b.n	2 <rust_begin_unwind+0x2>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:58
        console_print(b" line 0x");
  80:	f240 0000 	movw	r0, #0
  84:	f2c0 0000 	movt	r0, #0
  88:	2108      	movs	r1, #8
  8a:	f7ff fffe 	bl	0 <mylib::base::console_print>
  8e:	e7ff      	b.n	90 <rust_begin_unwind+0x90>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:59
        unsafe { console_printhex(line as u8) }  //  TODO: Print in decimal not hex. Allow more than 255 lines.
  90:	9803      	ldr	r0, [sp, #12]
  92:	b2c0      	uxtb	r0, r0
  94:	f7ff fffe 	bl	0 <console_printhex>
  98:	e7ff      	b.n	2 <rust_begin_unwind+0x2>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:60
        console_print(b"\n");
  9a:	f240 0000 	movw	r0, #0
  9e:	f2c0 0000 	movt	r0, #0
  a2:	2101      	movs	r1, #1
  a4:	f7ff fffe 	bl	0 <mylib::base::console_print>
  a8:	e7ff      	b.n	2 <console_flush+0x2>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:61
        unsafe { console_flush() }
  aa:	f7ff fffe 	bl	0 <console_flush>
  ae:	e7ff      	b.n	b0 <rust_begin_unwind+0xb0>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:53
    if let Some(location) = info.location() {
  b0:	e002      	b.n	b8 <rust_begin_unwind+0xb8>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:64
        unsafe { console_flush() }
  b2:	f7ff fffe 	bl	0 <console_flush>
  b6:	e7ff      	b.n	2 <__bkpt+0x2>
_ZN8cortex_m3asm4bkpt17h798662f8f8b2ad62E():
/home/breetai/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.2/src/asm.rs:19
        () => unsafe {
            extern "C" {
                fn __bkpt();
            }

            __bkpt();
  b8:	f7ff fffe 	bl	0 <__bkpt>
rust_begin_unwind():
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:67
    }
    //  Pause in the debugger.
    bkpt();
  bc:	e7ff      	b.n	be <rust_begin_unwind+0xbe>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:69
    //  Loop forever so that device won't restart.
    loop {}
  be:	e7ff      	b.n	c0 <rust_begin_unwind+0xc0>
  c0:	e7fe      	b.n	c0 <rust_begin_unwind+0xc0>

mylib-92127ab040a99ce6.46jzzpo6t469f1un.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 46jzzpo6t469f1un
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007b l       .debug_str	00000000 
00000081 l       .debug_str	00000000 
0000008b l       .debug_str	00000000 
000000c7 l       .debug_str	00000000 
000000da l       .debug_str	00000000 
000000de l       .debug_str	00000000 
00000118 l       .debug_str	00000000 
00000129 l       .debug_str	00000000 
0000012e l       .debug_str	00000000 
00000133 l       .debug_str	00000000 
00000137 l       .debug_str	00000000 
0000013a l       .debug_str	00000000 
00000144 l       .debug_str	00000000 
0000014d l       .debug_str	00000000 
00000155 l       .debug_str	00000000 
00000159 l       .debug_str	00000000 
00000163 l       .debug_str	00000000 
00000167 l       .debug_str	00000000 
00000173 l       .debug_str	00000000 
00000193 l       .debug_str	00000000 
000001a0 l       .debug_str	00000000 
000001aa l       .debug_str	00000000 
000001b0 l       .debug_str	00000000 
000001c4 l       .debug_str	00000000 
000001c9 l       .debug_str	00000000 
00000000 l     O .rodata..L__unnamed_1	00000013 .L__unnamed_1
00000000 l     O .rodata..L__unnamed_2	00000011 .L__unnamed_2
00000000 l    d  .text._ZN5mylib9send_coap18start_network_task17hf63bec1535f1bf96E	00000000 .text._ZN5mylib9send_coap18start_network_task17hf63bec1535f1bf96E
00000000 l    d  .text._ZN5mylib9send_coap16send_sensor_data17h0775f4d620c13bdfE	00000000 .text._ZN5mylib9send_coap16send_sensor_data17h0775f4d620c13bdfE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 .hidden mylib::base::console_print
00000000 g     F .text._ZN5mylib9send_coap16send_sensor_data17h0775f4d620c13bdfE	00000022 .hidden mylib::send_coap::send_sensor_data
00000000 g     F .text._ZN5mylib9send_coap18start_network_task17hf63bec1535f1bf96E	00000018 .hidden mylib::send_coap::start_network_task



Disassembly of section .text._ZN5mylib9send_coap18start_network_task17hf63bec1535f1bf96E:

00000000 <mylib::send_coap::start_network_task>:
_ZN5mylib9send_coap18start_network_task17hf63bec1535f1bf96E():
/home/breetai/code/stm32bluepill-mynewt-sensor/src/send_coap.rs:20

///  TODO: Start the Network Task in the background.  The Network Task prepares the network drivers
///  (ESP8266 and nRF24L01) for transmitting sensor data messages.  
///  Connecting the ESP8266 to the WiFi access point may be slow so we do this in the background.
///  Also perform WiFi Geolocation if it is enabled.  Return 0 if successful.
pub fn start_network_task() -> i32 {
   0:	b580      	push	{r7, lr}
   2:	466f      	mov	r7, sp
/home/breetai/code/stm32bluepill-mynewt-sensor/src/send_coap.rs:21
    console_print(b"start_network_task\n");
   4:	f240 0000 	movw	r0, #0
   8:	f2c0 0000 	movt	r0, #0
   c:	2113      	movs	r1, #19
   e:	f7ff fffe 	bl	0 <mylib::base::console_print>
  12:	e7ff      	b.n	14 <mylib::send_coap::start_network_task+0x14>
  14:	2000      	movs	r0, #0
/home/breetai/code/stm32bluepill-mynewt-sensor/src/send_coap.rs:23
    0
}
  16:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib9send_coap16send_sensor_data17h0775f4d620c13bdfE:

00000000 <mylib::send_coap::send_sensor_data>:
_ZN5mylib9send_coap16send_sensor_data17h0775f4d620c13bdfE():
/home/breetai/code/stm32bluepill-mynewt-sensor/src/send_coap.rs:34
///  For Collector Node: sensor_node is the Sensor Node Address of the Sensor Node that transmitted
///  the sensor data (like `b3b4b5b6f1`)
///  The message will be enqueued for transmission by the CoAP / OIC Background Task 
///  so this function will return without waiting for the message to be transmitted.  
///  Return 0 if successful, SYS_EAGAIN if network is not ready yet.
pub fn send_sensor_data(_val: *const SensorValue, _sensor_node: &'static CStr) -> i32 {
   0:	b580      	push	{r7, lr}
   2:	466f      	mov	r7, sp
   4:	b084      	sub	sp, #16
   6:	9001      	str	r0, [sp, #4]
   8:	9102      	str	r1, [sp, #8]
   a:	9203      	str	r2, [sp, #12]
/home/breetai/code/stm32bluepill-mynewt-sensor/src/send_coap.rs:35
    console_print(b"send_sensor_data\n");
   c:	f240 0000 	movw	r0, #0
  10:	f2c0 0000 	movt	r0, #0
  14:	2111      	movs	r1, #17
  16:	f7ff fffe 	bl	0 <mylib::base::console_print>
  1a:	e7ff      	b.n	1c <mylib::send_coap::send_sensor_data+0x1c>
  1c:	2000      	movs	r0, #0
/home/breetai/code/stm32bluepill-mynewt-sensor/src/send_coap.rs:37
    0
}
  1e:	b004      	add	sp, #16
  20:	bd80      	pop	{r7, pc}

mylib-92127ab040a99ce6.856j2zxvbyfwa79.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 856j2zxvbyfwa79
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007b l       .debug_str	00000000 
00000081 l       .debug_str	00000000 
00000088 l       .debug_str	00000000 
0000008c l       .debug_str	00000000 
00000096 l       .debug_str	00000000 
000000a0 l       .debug_str	00000000 
000000a6 l       .debug_str	00000000 
000000b4 l       .debug_str	00000000 
000000f8 l       .debug_str	00000000 
0000010e l       .debug_str	00000000 
00000112 l       .debug_str	00000000 
00000151 l       .debug_str	00000000 
00000162 l       .debug_str	00000000 
000001a0 l       .debug_str	00000000 
000001b0 l       .debug_str	00000000 
000001b5 l       .debug_str	00000000 
000001b9 l       .debug_str	00000000 
000001bc l       .debug_str	00000000 
000001c6 l       .debug_str	00000000 
000001cf l       .debug_str	00000000 
000001d7 l       .debug_str	00000000 
000001db l       .debug_str	00000000 
000001e5 l       .debug_str	00000000 
000001e9 l       .debug_str	00000000 
000001f5 l       .debug_str	00000000 
000001fe l       .debug_str	00000000 
0000020d l       .debug_str	00000000 
00000211 l       .debug_str	00000000 
00000219 l       .debug_str	00000000 
00000235 l       .debug_str	00000000 
0000028e l       .debug_str	00000000 
00000295 l       .debug_str	00000000 
0000029d l       .debug_str	00000000 
000002ac l       .debug_str	00000000 
000002af l       .debug_str	00000000 
000002b4 l       .debug_str	00000000 
000002c0 l       .debug_str	00000000 
000002cc l       .debug_str	00000000 
000002de l       .debug_str	00000000 
000002e5 l       .debug_str	00000000 
000002eb l       .debug_str	00000000 
000002f7 l       .debug_str	00000000 
00000301 l       .debug_str	00000000 
00000307 l       .debug_str	00000000 
0000031b l       .debug_str	00000000 
00000320 l       .debug_str	00000000 
00000331 l       .debug_str	00000000 
0000033e l       .debug_str	00000000 
0000034a l       .debug_str	00000000 
00000358 l       .debug_str	00000000 
0000036f l       .debug_str	00000000 
00000381 l       .debug_str	00000000 
0000038a l       .debug_str	00000000 
00000393 l       .debug_str	00000000 
000003a5 l       .debug_str	00000000 
000003b4 l       .debug_str	00000000 
00000000 l     O .rodata..L__unnamed_1	0000000a .L__unnamed_1
00000000 l     O .rodata..L__unnamed_10	00000010 .L__unnamed_10
00000000 l     O .rodata..L__unnamed_11	00000031 .L__unnamed_11
00000000 l     O .rodata..L__unnamed_12	00000010 .L__unnamed_12
00000000 l     O .rodata..L__unnamed_13	00000016 .L__unnamed_13
00000000 l     O .rodata..L__unnamed_14	00000010 .L__unnamed_14
00000000 l     O .rodata..L__unnamed_15	00000001 .L__unnamed_15
00000000 l     O .rodata..L__unnamed_16	00000010 .L__unnamed_16
00000000 l     O .rodata..L__unnamed_17	00000019 .L__unnamed_17
00000000 l     O .rodata..L__unnamed_18	00000010 .L__unnamed_18
00000000 l     O .rodata..L__unnamed_19	00000002 .L__unnamed_19
00000000 l     O .rodata..L__unnamed_2	0000000d .L__unnamed_2
00000000 l     O .rodata..L__unnamed_3	00000019 .L__unnamed_3
00000000 l     O .rodata..L__unnamed_4	00000010 .L__unnamed_4
00000000 l     O .rodata..L__unnamed_5	0000003b .L__unnamed_5
00000000 l     O .rodata..L__unnamed_6	00000010 .L__unnamed_6
00000000 l     O .rodata..L__unnamed_7	00000010 .L__unnamed_7
00000000 l     O .rodata..L__unnamed_8	00000011 .L__unnamed_8
00000000 l     O .rodata..L__unnamed_9	00000029 .L__unnamed_9
00000000 l     F .text._ZN5mylib13listen_sensor15get_temperature17ha5530d5abac7f61eE	00000168 mylib::listen_sensor::get_temperature
00000000 l     F .text._ZN5mylib13listen_sensor16read_temperature17hde590a7b115da81cE	00000150 mylib::listen_sensor::read_temperature
00000000 l    d  .text._ZN5mylib13listen_sensor21start_sensor_listener17hdafda7a4e22e60f3E	00000000 .text._ZN5mylib13listen_sensor21start_sensor_listener17hdafda7a4e22e60f3E
00000000 l    d  .text._ZN5mylib13listen_sensor16read_temperature17hde590a7b115da81cE	00000000 .text._ZN5mylib13listen_sensor16read_temperature17hde590a7b115da81cE
00000000 l    d  .text._ZN5mylib13listen_sensor15get_temperature17ha5530d5abac7f61eE	00000000 .text._ZN5mylib13listen_sensor15get_temperature17ha5530d5abac7f61eE
00000000 l    d  .rodata..L__unnamed_20	00000000 .rodata..L__unnamed_20
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 core::slice::<impl [T]>::as_ptr
00000000         *UND*	00000000 core::panicking::panic
00000000 g     F .text._ZN5mylib13listen_sensor21start_sensor_listener17hdafda7a4e22e60f3E	000000fc .hidden mylib::listen_sensor::start_sensor_listener
00000000         *UND*	00000000 .hidden mylib::base::console_print
00000000         *UND*	00000000 .hidden mylib::sensor::register_listener
00000000         *UND*	00000000 .hidden mylib::send_coap::send_sensor_data
00000000         *UND*	00000000 cstr_core::CStr::from_ptr
00000000         *UND*	00000000 device_get_name
00000000         *UND*	00000000 get_temp_data
00000000         *UND*	00000000 get_temp_raw_data
00000000         *UND*	00000000 is_null_sensor
00000000         *UND*	00000000 is_null_sensor_data
00000000         *UND*	00000000 null_sensor
00000000         *UND*	00000000 sensor_get_device
00000000         *UND*	00000000 sensor_mgr_find_next_bydevname
00000000         *UND*	00000000 sensor_set_poll_rate_ms



Disassembly of section .text._ZN5mylib13listen_sensor21start_sensor_listener17hdafda7a4e22e60f3E:

00000000 <mylib::listen_sensor::start_sensor_listener>:
_ZN5mylib13listen_sensor21start_sensor_listener17hdafda7a4e22e60f3E():
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:30
///  Listener Function to send the sensor data to the Collector Node (if this is a Sensor Node)
///  or CoAP Server (is this is a Standalone Node).
///  For Collector Node: Start the Listeners for Remote Sensor 
///  Otherwise this is a Standalone Node with ESP8266, or a Sensor Node with nRF24L01.
///  Return 0 if successful.
pub fn start_sensor_listener() -> i32 {
   0:	b5f0      	push	{r4, r5, r6, r7, lr}
   2:	af03      	add	r7, sp, #12
   4:	f84d bd04 	str.w	fp, [sp, #-4]!
   8:	b096      	sub	sp, #88	; 0x58
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:31
    console_print(b"TMP poll \n");  //  SENSOR_DEVICE "\n";
   a:	f240 0000 	movw	r0, #0
   e:	f2c0 0000 	movt	r0, #0
  12:	210a      	movs	r1, #10
  14:	f7ff fffe 	bl	0 <mylib::base::console_print>
  18:	e7ff      	b.n	2 <mylib::listen_sensor::start_sensor_listener+0x2>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:34

    //  Set the sensor polling time to 10 seconds.  SENSOR_DEVICE is either "bme280_0" or "temp_stm32_0"
    let rc = unsafe { sensor_set_poll_rate_ms(SENSOR_DEVICE, SENSOR_POLL_TIME) };
  1a:	f240 0000 	movw	r0, #0
  1e:	f2c0 0000 	movt	r0, #0
  22:	f242 7110 	movw	r1, #10000	; 0x2710
  26:	f7ff fffe 	bl	0 <sensor_set_poll_rate_ms>
  2a:	4601      	mov	r1, r0
  2c:	9013      	str	r0, [sp, #76]	; 0x4c
  2e:	9105      	str	r1, [sp, #20]
  30:	e7ff      	b.n	32 <mylib::listen_sensor::start_sensor_listener+0x32>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:35
    assert!(rc == 0);
  32:	9805      	ldr	r0, [sp, #20]
  34:	2800      	cmp	r0, #0
  36:	d104      	bne.n	42 <mylib::listen_sensor::start_sensor_listener+0x42>
  38:	e7ff      	b.n	3a <mylib::listen_sensor::start_sensor_listener+0x3a>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:38

    //  Fetch the sensor by name, without locking the driver for exclusive access.
    let listen_sensor = unsafe { sensor_mgr_find_next_bydevname(SENSOR_DEVICE, null_sensor()) };
  3a:	f7ff fffe 	bl	0 <null_sensor>
  3e:	9004      	str	r0, [sp, #16]
  40:	e00b      	b.n	5a <mylib::listen_sensor::start_sensor_listener+0x5a>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:35
    assert!(rc == 0);
  42:	f240 0000 	movw	r0, #0
  46:	f2c0 0000 	movt	r0, #0
  4a:	f240 0200 	movw	r2, #0
  4e:	f2c0 0200 	movt	r2, #0
  52:	2119      	movs	r1, #25
  54:	f7ff fffe 	bl	0 <core::panicking::panic>
  58:	defe      	udf	#254	; 0xfe
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:38
    let listen_sensor = unsafe { sensor_mgr_find_next_bydevname(SENSOR_DEVICE, null_sensor()) };
  5a:	f240 0000 	movw	r0, #0
  5e:	f2c0 0000 	movt	r0, #0
  62:	9904      	ldr	r1, [sp, #16]
  64:	f7ff fffe 	bl	0 <sensor_mgr_find_next_bydevname>
  68:	4601      	mov	r1, r0
  6a:	9014      	str	r0, [sp, #80]	; 0x50
  6c:	9103      	str	r1, [sp, #12]
  6e:	e7ff      	b.n	70 <mylib::listen_sensor::start_sensor_listener+0x70>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:39
    assert!(!unsafe{ is_null_sensor(listen_sensor) });
  70:	9803      	ldr	r0, [sp, #12]
  72:	f7ff fffe 	bl	0 <is_null_sensor>
  76:	9002      	str	r0, [sp, #8]
  78:	e7ff      	b.n	7a <mylib::listen_sensor::start_sensor_listener+0x7a>
  7a:	9802      	ldr	r0, [sp, #8]
  7c:	07c1      	lsls	r1, r0, #31
  7e:	2900      	cmp	r1, #0
  80:	d11b      	bne.n	ba <mylib::listen_sensor::start_sensor_listener+0xba>
  82:	e7ff      	b.n	84 <mylib::listen_sensor::start_sensor_listener+0x84>
  84:	2000      	movs	r0, #0
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:42

    //  Define the listener function to be called after polling the temperature sensor.
    let listener = SensorListener {
  86:	9007      	str	r0, [sp, #28]
  88:	f04f 6180 	mov.w	r1, #67108864	; 0x4000000
  8c:	9106      	str	r1, [sp, #24]
  8e:	f240 0100 	movw	r1, #0
  92:	f2c0 0100 	movt	r1, #0
  96:	9108      	str	r1, [sp, #32]
  98:	2101      	movs	r1, #1
  9a:	9109      	str	r1, [sp, #36]	; 0x24
  9c:	900a      	str	r0, [sp, #40]	; 0x28
  9e:	a806      	add	r0, sp, #24
  a0:	a90c      	add	r1, sp, #48	; 0x30
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:50
        sl_arg        : LISTENER_CB,           //  Indicate to the listener function that this is a listener callback
        sl_next       : 0,                     //  Must be 0
    };

    //  Register the Listener Function to be called every 10 seconds, with the polled sensor data.
    let rc = register_listener(listen_sensor, listener);
  a2:	460a      	mov	r2, r1
  a4:	e890 5078 	ldmia.w	r0, {r3, r4, r5, r6, ip, lr}
  a8:	e882 5078 	stmia.w	r2, {r3, r4, r5, r6, ip, lr}
  ac:	9803      	ldr	r0, [sp, #12]
  ae:	f7ff fffe 	bl	0 <mylib::sensor::register_listener>
  b2:	4601      	mov	r1, r0
  b4:	9015      	str	r0, [sp, #84]	; 0x54
  b6:	9101      	str	r1, [sp, #4]
  b8:	e00b      	b.n	d2 <mylib::listen_sensor::start_sensor_listener+0xd2>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:39
    assert!(!unsafe{ is_null_sensor(listen_sensor) });
  ba:	f240 0000 	movw	r0, #0
  be:	f2c0 0000 	movt	r0, #0
  c2:	f240 0200 	movw	r2, #0
  c6:	f2c0 0200 	movt	r2, #0
  ca:	213b      	movs	r1, #59	; 0x3b
  cc:	f7ff fffe 	bl	0 <core::panicking::panic>
  d0:	defe      	udf	#254	; 0xfe
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:51
    assert!(rc == 0);
  d2:	9801      	ldr	r0, [sp, #4]
  d4:	2800      	cmp	r0, #0
  d6:	d105      	bne.n	e4 <mylib::listen_sensor::start_sensor_listener+0xe4>
  d8:	e7ff      	b.n	da <mylib::listen_sensor::start_sensor_listener+0xda>
  da:	2000      	movs	r0, #0
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:55

    //  Return 0 to indicate success.  This line should not end with a semicolon (;).
    0
}
  dc:	b016      	add	sp, #88	; 0x58
  de:	f85d bb04 	ldr.w	fp, [sp], #4
  e2:	bdf0      	pop	{r4, r5, r6, r7, pc}
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:51
    assert!(rc == 0);
  e4:	f240 0000 	movw	r0, #0
  e8:	f2c0 0000 	movt	r0, #0
  ec:	f240 0200 	movw	r2, #0
  f0:	f2c0 0200 	movt	r2, #0
  f4:	2119      	movs	r1, #25
  f6:	f7ff fffe 	bl	0 <core::panicking::panic>
  fa:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN5mylib13listen_sensor16read_temperature17hde590a7b115da81cE:

00000000 <mylib::listen_sensor::read_temperature>:
_ZN5mylib13listen_sensor16read_temperature17hde590a7b115da81cE():
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:70
///  This listener function is called by Mynewt every 10 seconds (for local sensors) or when sensor data is received
///  (for Remote Sensors).  Mynewt has fetched the raw or computed temperature value, passed through `sensor_data`.
///  If this is a Sensor Node, we send the sensor data to the Collector Node.
///  If this is a Collector Node or Standalone Node, we send the sensor data to the CoAP server.  
///  Return 0 if we have processed the sensor data successfully.
extern fn read_temperature(sensor: SensorPtr, _arg: SensorArg, sensor_data: SensorDataPtr, sensor_type: SensorType) -> i32 {
   0:	b580      	push	{r7, lr}
   2:	466f      	mov	r7, sp
   4:	b09c      	sub	sp, #112	; 0x70
   6:	68fb      	ldr	r3, [r7, #12]
   8:	f8d7 c008 	ldr.w	ip, [r7, #8]
   c:	9011      	str	r0, [sp, #68]	; 0x44
   e:	9112      	str	r1, [sp, #72]	; 0x48
  10:	9213      	str	r2, [sp, #76]	; 0x4c
  12:	9315      	str	r3, [sp, #84]	; 0x54
  14:	f8cd c050 	str.w	ip, [sp, #80]	; 0x50
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:72
    unsafe {
        console_print(b"read_temperature\n");
  18:	f240 0100 	movw	r1, #0
  1c:	f2c0 0100 	movt	r1, #0
  20:	f04f 0e11 	mov.w	lr, #17
  24:	900b      	str	r0, [sp, #44]	; 0x2c
  26:	4608      	mov	r0, r1
  28:	4671      	mov	r1, lr
  2a:	920a      	str	r2, [sp, #40]	; 0x28
  2c:	9309      	str	r3, [sp, #36]	; 0x24
  2e:	f8cd c020 	str.w	ip, [sp, #32]
  32:	f7ff fffe 	bl	0 <mylib::base::console_print>
  36:	e7ff      	b.n	38 <mylib::listen_sensor::read_temperature+0x38>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:75
        //  Check that the temperature data is valid.
        //  TODO
        if is_null_sensor_data(sensor_data) { return SYS_EINVAL; }  //  Exit if data is missing
  38:	980a      	ldr	r0, [sp, #40]	; 0x28
  3a:	f7ff fffe 	bl	0 <is_null_sensor_data>
  3e:	9007      	str	r0, [sp, #28]
  40:	e7ff      	b.n	42 <mylib::listen_sensor::read_temperature+0x42>
  42:	9807      	ldr	r0, [sp, #28]
  44:	07c1      	lsls	r1, r0, #31
  46:	2900      	cmp	r1, #0
  48:	d105      	bne.n	56 <mylib::listen_sensor::read_temperature+0x56>
  4a:	e7ff      	b.n	4c <mylib::listen_sensor::read_temperature+0x4c>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:76
        assert!(!is_null_sensor(sensor));
  4c:	980b      	ldr	r0, [sp, #44]	; 0x2c
  4e:	f7ff fffe 	bl	0 <is_null_sensor>
  52:	9006      	str	r0, [sp, #24]
  54:	e003      	b.n	5e <mylib::listen_sensor::read_temperature+0x5e>
  56:	f06f 0001 	mvn.w	r0, #1
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:75
        if is_null_sensor_data(sensor_data) { return SYS_EINVAL; }  //  Exit if data is missing
  5a:	900c      	str	r0, [sp, #48]	; 0x30
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:1
//!  Sensor app that reads sensor data from a temperature sensor and sends the sensor data to a CoAP server or Collector Node.
  5c:	e074      	b.n	148 <mylib::listen_sensor::read_temperature+0x148>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:76
        assert!(!is_null_sensor(sensor));
  5e:	9806      	ldr	r0, [sp, #24]
  60:	07c1      	lsls	r1, r0, #31
  62:	2900      	cmp	r1, #0
  64:	d107      	bne.n	76 <mylib::listen_sensor::read_temperature+0x76>
  66:	e7ff      	b.n	68 <mylib::listen_sensor::read_temperature+0x68>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:80

        //  For Sensor Node or Standalone Node: Device name is "bme280_0" or "temp_stm32_0"
        //  For Collector Node: Device name is the Sensor Node Address of the Sensor Node that transmitted the sensor data, like "b3b4b5b6f1"
        let device = sensor_get_device(sensor);
  68:	980b      	ldr	r0, [sp, #44]	; 0x2c
  6a:	f7ff fffe 	bl	0 <sensor_get_device>
  6e:	4601      	mov	r1, r0
  70:	9017      	str	r0, [sp, #92]	; 0x5c
  72:	9105      	str	r1, [sp, #20]
  74:	e00b      	b.n	8e <mylib::listen_sensor::read_temperature+0x8e>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:76
        assert!(!is_null_sensor(sensor));
  76:	f240 0000 	movw	r0, #0
  7a:	f2c0 0000 	movt	r0, #0
  7e:	f240 0200 	movw	r2, #0
  82:	f2c0 0200 	movt	r2, #0
  86:	2129      	movs	r1, #41	; 0x29
  88:	f7ff fffe 	bl	0 <core::panicking::panic>
  8c:	defe      	udf	#254	; 0xfe
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:81
        let c_buf: *const c_char = device_get_name(device);
  8e:	9805      	ldr	r0, [sp, #20]
  90:	f7ff fffe 	bl	0 <device_get_name>
  94:	4601      	mov	r1, r0
  96:	9018      	str	r0, [sp, #96]	; 0x60
  98:	9104      	str	r1, [sp, #16]
  9a:	e7ff      	b.n	9c <mylib::listen_sensor::read_temperature+0x9c>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:82
        let device_name: &CStr = CStr::from_ptr(c_buf);
  9c:	9804      	ldr	r0, [sp, #16]
  9e:	f7ff fffe 	bl	0 <cstr_core::CStr::from_ptr>
  a2:	9003      	str	r0, [sp, #12]
  a4:	9102      	str	r1, [sp, #8]
  a6:	e7ff      	b.n	a8 <mylib::listen_sensor::read_temperature+0xa8>
  a8:	9803      	ldr	r0, [sp, #12]
  aa:	9019      	str	r0, [sp, #100]	; 0x64
  ac:	9902      	ldr	r1, [sp, #8]
  ae:	911a      	str	r1, [sp, #104]	; 0x68
  b0:	a80d      	add	r0, sp, #52	; 0x34
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:86
        //assert!(device_name.len() > 0);  //  console_printf("device_name %s\n", device_name);
        
        //  Get the temperature sensor value. It could be raw or computed.
        let temp_sensor_value = get_temperature(sensor_data, sensor_type);
  b2:	990a      	ldr	r1, [sp, #40]	; 0x28
  b4:	9a08      	ldr	r2, [sp, #32]
  b6:	9b09      	ldr	r3, [sp, #36]	; 0x24
  b8:	f7ff fffe 	bl	0 <mylib::listen_sensor::read_temperature>
  bc:	e7ff      	b.n	be <mylib::listen_sensor::read_temperature+0xbe>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:87
        assert!(temp_sensor_value.val_type != 0);
  be:	980e      	ldr	r0, [sp, #56]	; 0x38
  c0:	2800      	cmp	r0, #0
  c2:	d004      	beq.n	ce <mylib::listen_sensor::read_temperature+0xce>
  c4:	e7ff      	b.n	c6 <mylib::listen_sensor::read_temperature+0xc6>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:88
        if temp_sensor_value.val_type == 0 { return -1; }  //  Invalid type.
  c6:	980e      	ldr	r0, [sp, #56]	; 0x38
  c8:	2800      	cmp	r0, #0
  ca:	d015      	beq.n	f8 <mylib::listen_sensor::read_temperature+0xf8>
  cc:	e00b      	b.n	e6 <mylib::listen_sensor::read_temperature+0xe6>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:87
        assert!(temp_sensor_value.val_type != 0);
  ce:	f240 0000 	movw	r0, #0
  d2:	f2c0 0000 	movt	r0, #0
  d6:	f240 0200 	movw	r2, #0
  da:	f2c0 0200 	movt	r2, #0
  de:	2131      	movs	r1, #49	; 0x31
  e0:	f7ff fffe 	bl	0 <core::panicking::panic>
  e4:	defe      	udf	#254	; 0xfe
  e6:	a80d      	add	r0, sp, #52	; 0x34
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:95
        //#if MYNEWT_VAL(SENSOR_COAP)   //  If we are sending sensor data to CoAP server or Collector Node...
        //  Compose a CoAP message with the temperature sensor data and send to the 
        //  CoAP server or Collector Node.  The message will be enqueued for transmission by the OIC 
        //  background task so this function will return without waiting for the message 
        //  to be transmitted.
        let rc = send_sensor_data(&temp_sensor_value, device_name);
  e8:	9903      	ldr	r1, [sp, #12]
  ea:	9a02      	ldr	r2, [sp, #8]
  ec:	f7ff fffe 	bl	0 <mylib::send_coap::send_sensor_data>
  f0:	4601      	mov	r1, r0
  f2:	901b      	str	r0, [sp, #108]	; 0x6c
  f4:	9101      	str	r1, [sp, #4]
  f6:	e003      	b.n	100 <mylib::listen_sensor::read_temperature+0x100>
  f8:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:88
        if temp_sensor_value.val_type == 0 { return -1; }  //  Invalid type.
  fc:	900c      	str	r0, [sp, #48]	; 0x30
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:1
  fe:	e022      	b.n	146 <mylib::listen_sensor::read_temperature+0x146>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:99

        //  SYS_EAGAIN means that the Network Task is still starting up the ESP8266.
        //  We drop the sensor data and send at the next poll.
        if rc == SYS_EAGAIN {
 100:	9801      	ldr	r0, [sp, #4]
 102:	1d81      	adds	r1, r0, #6
 104:	2900      	cmp	r1, #0
 106:	d004      	beq.n	112 <mylib::listen_sensor::read_temperature+0x112>
 108:	e7ff      	b.n	10a <mylib::listen_sensor::read_temperature+0x10a>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:103
            console_print(b"TMP network not ready\n");
            return 0; 
        }
        assert!(rc == 0);
 10a:	9801      	ldr	r0, [sp, #4]
 10c:	2800      	cmp	r0, #0
 10e:	d10e      	bne.n	12e <mylib::listen_sensor::read_temperature+0x12e>
 110:	e00a      	b.n	128 <mylib::listen_sensor::read_temperature+0x128>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:100
            console_print(b"TMP network not ready\n");
 112:	f240 0000 	movw	r0, #0
 116:	f2c0 0000 	movt	r0, #0
 11a:	2116      	movs	r1, #22
 11c:	f7ff fffe 	bl	0 <mylib::base::console_print>
 120:	e7ff      	b.n	122 <mylib::listen_sensor::read_temperature+0x122>
 122:	2000      	movs	r0, #0
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:101
            return 0; 
 124:	900c      	str	r0, [sp, #48]	; 0x30
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:1
 126:	e00e      	b.n	146 <mylib::listen_sensor::read_temperature+0x146>
 128:	2000      	movs	r0, #0
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:106
        //#endif  //  MYNEWT_VAL(SENSOR_COAP)
    }
    0
 12a:	900c      	str	r0, [sp, #48]	; 0x30
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:107
}
 12c:	e00d      	b.n	14a <mylib::listen_sensor::read_temperature+0x14a>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:103
        assert!(rc == 0);
 12e:	f240 0000 	movw	r0, #0
 132:	f2c0 0000 	movt	r0, #0
 136:	f240 0200 	movw	r2, #0
 13a:	f2c0 0200 	movt	r2, #0
 13e:	2119      	movs	r1, #25
 140:	f7ff fffe 	bl	0 <core::panicking::panic>
 144:	defe      	udf	#254	; 0xfe
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:1
 146:	e7ff      	b.n	148 <mylib::listen_sensor::read_temperature+0x148>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:107
}
 148:	e7ff      	b.n	14a <mylib::listen_sensor::read_temperature+0x14a>
 14a:	980c      	ldr	r0, [sp, #48]	; 0x30
 14c:	b01c      	add	sp, #112	; 0x70
 14e:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib13listen_sensor15get_temperature17ha5530d5abac7f61eE:

00000000 <mylib::listen_sensor::get_temperature>:
_ZN5mylib13listen_sensor15get_temperature17ha5530d5abac7f61eE():
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:112

///  Get the temperature value, raw or computed.  `sensor_data` contains the raw or computed temperature. 
///  `sensor_type` indicates whether `sensor_data` contains raw or computed temperature.  We return 
///  the raw or computed temperature, as well as the key and value type.
fn get_temperature(sensor_data: *const CVoid, sensor_type: SensorType) -> SensorValue {
   0:	b580      	push	{r7, lr}
   2:	466f      	mov	r7, sp
   4:	b096      	sub	sp, #88	; 0x58
   6:	469c      	mov	ip, r3
   8:	4696      	mov	lr, r2
   a:	910f      	str	r1, [sp, #60]	; 0x3c
   c:	9311      	str	r3, [sp, #68]	; 0x44
   e:	9210      	str	r2, [sp, #64]	; 0x40
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:114
    let mut return_value = SensorValue {
        key: b"\0".as_ptr(),
  10:	f240 0200 	movw	r2, #0
  14:	f2c0 0200 	movt	r2, #0
  18:	2301      	movs	r3, #1
  1a:	9006      	str	r0, [sp, #24]
  1c:	4610      	mov	r0, r2
  1e:	9105      	str	r1, [sp, #20]
  20:	4619      	mov	r1, r3
  22:	f8cd c010 	str.w	ip, [sp, #16]
  26:	f8cd e00c 	str.w	lr, [sp, #12]
  2a:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::as_ptr>
  2e:	9002      	str	r0, [sp, #8]
  30:	e7ff      	b.n	32 <mylib::listen_sensor::get_temperature+0x32>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:113
    let mut return_value = SensorValue {
  32:	9802      	ldr	r0, [sp, #8]
  34:	9007      	str	r0, [sp, #28]
  36:	2100      	movs	r1, #0
  38:	9108      	str	r1, [sp, #32]
  3a:	f8ad 1024 	strh.w	r1, [sp, #36]	; 0x24
  3e:	910a      	str	r1, [sp, #40]	; 0x28
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:122
        float_val: 0.0,
    };
    unsafe {
        //assert!(sensor_data);
        match sensor_type {                                //  Is this raw or computed temperature?
            SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {  //  If this is raw temperature...
  40:	9903      	ldr	r1, [sp, #12]
  42:	f081 6280 	eor.w	r2, r1, #67108864	; 0x4000000
  46:	9b04      	ldr	r3, [sp, #16]
  48:	431a      	orrs	r2, r3
  4a:	2a00      	cmp	r2, #0
  4c:	d13c      	bne.n	c8 <mylib::listen_sensor::get_temperature+0xc8>
  4e:	e7ff      	b.n	50 <mylib::listen_sensor::get_temperature+0x50>
  50:	2000      	movs	r0, #0
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:124
                //  Interpret the sensor data as a sensor_temp_raw_data struct that contains raw temp.
                let mut rawtempdata = SensorTempRawData {
  52:	900b      	str	r0, [sp, #44]	; 0x2c
  54:	f88d 0030 	strb.w	r0, [sp, #48]	; 0x30
  58:	a90b      	add	r1, sp, #44	; 0x2c
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:128
                    strd_temp_raw: 0,
                    strd_temp_raw_is_valid: 0,
                };
                let rc = get_temp_raw_data(sensor_data, &mut rawtempdata);
  5a:	9805      	ldr	r0, [sp, #20]
  5c:	f7ff fffe 	bl	0 <get_temp_raw_data>
  60:	4601      	mov	r1, r0
  62:	9015      	str	r0, [sp, #84]	; 0x54
  64:	9101      	str	r1, [sp, #4]
  66:	e7ff      	b.n	68 <mylib::listen_sensor::get_temperature+0x68>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:129
                assert!(rc == 0);
  68:	9801      	ldr	r0, [sp, #4]
  6a:	2800      	cmp	r0, #0
  6c:	d105      	bne.n	7a <mylib::listen_sensor::get_temperature+0x7a>
  6e:	e7ff      	b.n	70 <mylib::listen_sensor::get_temperature+0x70>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:132

                //  Check that the raw temperature data is valid.
                if rawtempdata.strd_temp_raw_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  70:	f89d 0030 	ldrb.w	r0, [sp, #48]	; 0x30
  74:	2800      	cmp	r0, #0
  76:	d017      	beq.n	a8 <mylib::listen_sensor::get_temperature+0xa8>
  78:	e00b      	b.n	92 <mylib::listen_sensor::get_temperature+0x92>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:129
                assert!(rc == 0);
  7a:	f240 0000 	movw	r0, #0
  7e:	f2c0 0000 	movt	r0, #0
  82:	f240 0200 	movw	r2, #0
  86:	f2c0 0200 	movt	r2, #0
  8a:	2119      	movs	r1, #25
  8c:	f7ff fffe 	bl	0 <core::panicking::panic>
  90:	defe      	udf	#254	; 0xfe
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:135

                //  Raw temperature data is valid.  Copy and display it.
                return_value.int_val = rawtempdata.strd_temp_raw as u16;  //  Raw Temperature in integer (0 to 4095)
  92:	980b      	ldr	r0, [sp, #44]	; 0x2c
  94:	f8ad 0024 	strh.w	r0, [sp, #36]	; 0x24
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:136
                console_print(b"TMP listener got rawtmp \n");  // return_value->int_val);
  98:	f240 0000 	movw	r0, #0
  9c:	f2c0 0000 	movt	r0, #0
  a0:	2119      	movs	r1, #25
  a2:	f7ff fffe 	bl	0 <mylib::base::console_print>
  a6:	e00e      	b.n	c6 <mylib::listen_sensor::get_temperature+0xc6>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:132
                if rawtempdata.strd_temp_raw_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  a8:	9807      	ldr	r0, [sp, #28]
  aa:	9908      	ldr	r1, [sp, #32]
  ac:	9a09      	ldr	r2, [sp, #36]	; 0x24
  ae:	9b0a      	ldr	r3, [sp, #40]	; 0x28
  b0:	f8dd c018 	ldr.w	ip, [sp, #24]
  b4:	f8cc 300c 	str.w	r3, [ip, #12]
  b8:	f8cc 2008 	str.w	r2, [ip, #8]
  bc:	f8cc 1004 	str.w	r1, [ip, #4]
  c0:	f8cc 0000 	str.w	r0, [ip]
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:1
  c4:	e04d      	b.n	162 <mylib::listen_sensor::get_temperature+0x162>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:121
        match sensor_type {                                //  Is this raw or computed temperature?
  c6:	e036      	b.n	136 <mylib::listen_sensor::get_temperature+0x136>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:138
            },
            SENSOR_TYPE_AMBIENT_TEMPERATURE => {      //  If this is computed temperature...
  c8:	9803      	ldr	r0, [sp, #12]
  ca:	9012      	str	r0, [sp, #72]	; 0x48
  cc:	9904      	ldr	r1, [sp, #16]
  ce:	9113      	str	r1, [sp, #76]	; 0x4c
  d0:	2200      	movs	r2, #0
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:140
                //  Interpret the sensor data as a sensor_temp_data struct that contains computed temp.
                let mut tempdata = SensorTempData {
  d2:	920d      	str	r2, [sp, #52]	; 0x34
  d4:	f88d 2038 	strb.w	r2, [sp, #56]	; 0x38
  d8:	a90d      	add	r1, sp, #52	; 0x34
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:144
                    std_temp: 0.0,
                    std_temp_is_valid: 0,
                };
                let rc = get_temp_data(sensor_data, &mut tempdata);
  da:	9805      	ldr	r0, [sp, #20]
  dc:	f7ff fffe 	bl	0 <get_temp_data>
  e0:	4601      	mov	r1, r0
  e2:	9014      	str	r0, [sp, #80]	; 0x50
  e4:	9100      	str	r1, [sp, #0]
  e6:	e7ff      	b.n	e8 <mylib::listen_sensor::get_temperature+0xe8>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:145
                assert!(rc == 0);
  e8:	9800      	ldr	r0, [sp, #0]
  ea:	2800      	cmp	r0, #0
  ec:	d105      	bne.n	fa <mylib::listen_sensor::get_temperature+0xfa>
  ee:	e7ff      	b.n	f0 <mylib::listen_sensor::get_temperature+0xf0>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:148

                //  Check that the computed temperature data is valid.
                if tempdata.std_temp_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  f0:	f89d 0038 	ldrb.w	r0, [sp, #56]	; 0x38
  f4:	2800      	cmp	r0, #0
  f6:	d00f      	beq.n	118 <mylib::listen_sensor::get_temperature+0x118>
  f8:	e00b      	b.n	112 <mylib::listen_sensor::get_temperature+0x112>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:145
                assert!(rc == 0);
  fa:	f240 0000 	movw	r0, #0
  fe:	f2c0 0000 	movt	r0, #0
 102:	f240 0200 	movw	r2, #0
 106:	f2c0 0200 	movt	r2, #0
 10a:	2119      	movs	r1, #25
 10c:	f7ff fffe 	bl	0 <core::panicking::panic>
 110:	defe      	udf	#254	; 0xfe
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:151

                //  Computed temperature data is valid.  Copy and display it.
                return_value.float_val = tempdata.std_temp;  //  Temperature in floating point.
 112:	980d      	ldr	r0, [sp, #52]	; 0x34
 114:	900a      	str	r0, [sp, #40]	; 0x28
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:121
        match sensor_type {                                //  Is this raw or computed temperature?
 116:	e00e      	b.n	136 <mylib::listen_sensor::get_temperature+0x136>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:148
                if tempdata.std_temp_is_valid == 0 { return return_value; }  //  Exit if data is not valid
 118:	9807      	ldr	r0, [sp, #28]
 11a:	9908      	ldr	r1, [sp, #32]
 11c:	9a09      	ldr	r2, [sp, #36]	; 0x24
 11e:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 120:	f8dd c018 	ldr.w	ip, [sp, #24]
 124:	f8cc 300c 	str.w	r3, [ip, #12]
 128:	f8cc 2008 	str.w	r2, [ip, #8]
 12c:	f8cc 1004 	str.w	r1, [ip, #4]
 130:	f8cc 0000 	str.w	r0, [ip]
/home/breetai/code/stm32bluepill-mynewt-sensor/src/lib.rs:1
 134:	e015      	b.n	2e <mylib::listen_sensor::get_temperature+0x2e>
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:164
                assert!(false);  //  Unknown temperature sensor type
                return return_value;
            }
        }
        //  Return the key and value type for raw or computed temperature, as defined in temp_stm32.h.
        return_value.key = TEMP_SENSOR_KEY;
 136:	f240 0000 	movw	r0, #0
 13a:	f2c0 0000 	movt	r0, #0
 13e:	9007      	str	r0, [sp, #28]
 140:	2001      	movs	r0, #1
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:165
        return_value.val_type = TEMP_SENSOR_VALUE_TYPE;
 142:	9008      	str	r0, [sp, #32]
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:167
    };
    return_value
 144:	9807      	ldr	r0, [sp, #28]
 146:	9908      	ldr	r1, [sp, #32]
 148:	9a09      	ldr	r2, [sp, #36]	; 0x24
 14a:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 14c:	f8dd c018 	ldr.w	ip, [sp, #24]
 150:	f8cc 300c 	str.w	r3, [ip, #12]
 154:	f8cc 2008 	str.w	r2, [ip, #8]
 158:	f8cc 1004 	str.w	r1, [ip, #4]
 15c:	f8cc 0000 	str.w	r0, [ip]
/home/breetai/code/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:168
}
 160:	e000      	b.n	164 <mylib::listen_sensor::get_temperature+0x164>
 162:	e7ff      	b.n	164 <mylib::listen_sensor::get_temperature+0x164>
 164:	b016      	add	sp, #88	; 0x58
 166:	bd80      	pop	{r7, pc}
arm-none-eabi-objdump: lib.rmeta: file format not recognized
