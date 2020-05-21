#!/usr/bin/env bash
#  Install Apache Mynewt for Ubuntu Linux or Debian Linux 11 (Bullseye).  Based on https://mynewt.apache.org/latest/newt/install/newt_linux.html.  

echo "Installing Apache Mynewt for Linux..."
set -e  #  Exit when any command fails.
set -x  #  Echo all commands.
#  echo $PATH

echo "***** Installing ST-Link V2 driver..."

#  Install the ST-Link V2 driver: https://docs.platformio.org/en/latest/faq.html#platformio-udev-rules
if [ ! -e /etc/udev/rules.d/99-platformio-udev.rules ]; then
    curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/develop/scripts/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules
fi

echo "***** Installing git..."

sudo apt install git -y
git --version  #  Should show "git version 2.21.0" or later.

echo "***** Installing openocd..."

#  Install OpenOCD into the ./openocd folder.  
if [ ! -e openocd/bin/openocd ]; then
    sudo apt install openocd -y
    if [ ! -d openocd/bin ]; then
        mkdir -p openocd/bin
    fi
    ln -s /usr/bin/openocd openocd/bin/openocd
fi

echo "***** Installing npm..."

#  Install npm.
if [ ! -e /usr/local/bin/npm ] || [ ! -e /usr/bin/npm ] ; then
    sudo apt update  -y  #  Update all Ubuntu packages.
    sudo apt upgrade -y  #  Upgrade all Ubuntu packages.
    curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
    sudo apt install nodejs -y
    node --version
fi

echo "***** Installing Arm Toolchain..."

#  Install Arm Toolchain into $HOME/opt/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/*/.content/. From https://xpack.github.io/arm-none-eabi-gcc/install/
if [ ! -d $HOME/opt/xPacks/@xpack-dev-tools/arm-none-eabi-gcc ]; then
    sudo npm install --global xpm
    # xpm install --global @gnu-mcu-eclipse/arm-none-eabi-gcc
    xpm install @xpack-dev-tools/arm-none-eabi-gcc
    gccpath=`ls -d $HOME/opt/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/*/.content/bin`
    if [[ ! "$PATH" = *"arm-none-eabi-gcc"* ]] ; then 
        echo export PATH=\$PATH:$gccpath >> ~/.profile
        export PATH=$gccpath:$PATH
    fi
fi
arm-none-eabi-gcc --version  #  Should show "gcc version 8.2.1 20181213" or later.

echo "***** Installing go..."

#  Install go 1.14 to prevent newt build error: "go 1.10 or later is required (detected version: 1.14.x)"
golangpath=/usr/lib/go-1.14/bin
if [ ! -e $golangpath/go ]; then
    sudo apt install golang-1.14 -y
    if [[ ! "$PATH" = *"go-1"* ]] ; then 
        echo export PATH=\$PATH:$golangpath: >> ~/.profile
    fi
    export PATH=$PATH:$golangpath:
fi
#  Prevent mismatch library errors when building newt.
export GOROOT=
go version  #  Should show "go1.10.1" or later.

echo "***** Fixing ownership..."

#  Change owner from root back to user for the installed packages.
if [ -d "$HOME/.caches" ]; then
    sudo chown -R $USER:$USER "$HOME/.caches"
fi
if [ -d "$HOME/.config" ]; then
    sudo chown -R $USER:$USER "$HOME/.config"
fi
if [ -d "$HOME/opt" ]; then
    sudo chown -R $USER:$USER "$HOME/opt"
fi

echo "***** Installing newt..."

#  Install latest official release of newt.  If dev version from Tutorial 1 is installed, it will be overwritten.
#  Based on https://mynewt.apache.org/latest/newt/install/newt_linux.html

wget -qO - https://raw.githubusercontent.com/JuulLabs-OSS/debian-mynewt/master/mynewt.gpg.key | sudo apt-key add -
sudo tee /etc/apt/sources.list.d/mynewt.list <<EOF
deb https://raw.githubusercontent.com/JuulLabs-OSS/debian-mynewt/master latest main
EOF
sudo apt update -y
sudo apt install newt -y
which newt    #  Should show "/usr/bin/newt"
newt version  #  Should show "Version: 1.6.0" or later.  Should NOT show "...-dev".

echo "***** Installing mynewt..."

#  Remove the existing Mynewt OS in "repos"
if [ -d repos ]; then
    rm -rf repos
fi

#  Download Mynewt OS into the current project folder, under "repos" subfolder.
set +e              #  TODO: Remove this when newt install is fixed
newt install -v -f  #  TODO: "git checkout" fails due to uncommitted files
set -e              #  TODO: Remove this when newt install is fixed

echo "***** Reparing mynewt..."

#  If apache-mynewt-core is missing, then the installation failed.
if [ ! -d repos/apache-mynewt-core ]; then
    echo "***** newt install failed"
    exit 1
fi

#  If apache-mynewt-nimble is missing, then the installation failed.
if [ ! -d repos/apache-mynewt-nimble ]; then
    echo "***** newt install failed"
    exit 1
fi

echo "***** Patching mynewt with custom files..."

#  Change the ROM layout to reduce bootloader size. Move application image to lower 64 KB ROM.
if [ ! -e repos/apache-mynewt-core/hw/bsp/bluepill/bluepill.ld.old ]; then
    cp repos/apache-mynewt-core/hw/bsp/bluepill/bluepill.ld \
       repos/apache-mynewt-core/hw/bsp/bluepill/bluepill.ld.old
fi
cp patch/bluepill.ld \
       repos/apache-mynewt-core/hw/bsp/bluepill/bluepill.ld

if [ ! -e repos/apache-mynewt-core/hw/bsp/bluepill/bsp.yml.old ]; then
    cp repos/apache-mynewt-core/hw/bsp/bluepill/bsp.yml \
       repos/apache-mynewt-core/hw/bsp/bluepill/bsp.yml.old
fi
cp patch/bsp.yml \
       repos/apache-mynewt-core/hw/bsp/bluepill/bsp.yml

set +x  #  Stop echoing all commands.
echo ✅ ◾ ️Done! Please restart Visual Studio Code to activate the extensions
