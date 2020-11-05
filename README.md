# meta-somlabs

## Introduction

Meta-somlabs is a layer providing the VisionSOM-STM32MP1 module and VisionCB-STM32MP1-STD carrier board hardware support for Yocto-based OpenSTLinux system.

## System image

This layer should be used in order to build the st-image-weston image. It provides changes including the QT libraries and the SoMLabs demo application.

## Building the system image

In order to build the system image a Distribution Package provided by STMicroelectronics is required. The whole building process is described on the ST wiki pages:

https://wiki.st.com/stm32mpu/wiki/STM32MP1_Distribution_Package

The summary of required steps is shown below:

```shell
cd <working directory path>/Distribution-Package
mkdir openstlinux-5.4-dunfell-mp1-20-06-24
cd openstlinux-5.4-dunfell-mp1-20-06-24
repo init -u https://github.com/STMicroelectronics/oe-manifest.git -b refs/tags/openstlinux-5.4-dunfell-mp1-20-06-24
repo sync
cd layers/meta-st
git clone -b dunfell https://github.com/SoMLabs/openst-meta-somlabs.git meta-somlabs
cd ../../
DISTRO=openstlinux-weston MACHINE=<MACHINE_NAME> source layers/meta-st/scripts/envsetup.sh
bitbake st-image-weston
```

The following VisionSOM machines are available:
* stm32mp157a-visionsom-rgb-emmc-mx Module with eMMC memory and RGB display connected
* stm32mp157a-visionsom-rgb-sd-mx   Module with SD card and RGB display connected
* stm32mp157a-visionsom-dsi-emmc-mx Module with eMMC memory and DSI display connected
* stm32mp157a-visionsom-dsi-sd-mx   Module with SD card and DSI display connected

The compiled image files are located in the directory:

```
openstlinux-5.4-dunfell-mp1-20-06-24/build-openstlinuxweston-<MACHINE_NAME>/tmp-glibc/deploy/images/<MACHINE_NAME>
```

## Installing SD card image

The SD card image needs to be created using the available script after the building process:

```
cd tmp-glibc/deploy/images/<MACHINE_NAME>
./create_sdcard_from_flashlayout.sh ../flashlayout_st-image-weston/trusted/FlashLayout_sdcard_<MACHINE_NAME>-trusted.tsv
```

The system image is located in the FlashLayout_sdcard_<MACHINE_NAME>-trusted.raw file in the tmp-glibc/deploy/images/<MACHINE_NAME> directory. To install the image to a card connected to host PC the dd command may be used:

```
sudo dd if=FlashLayout_sdcard_<MACHINE_NAME>-trusted.raw of=/dev/sdX bs=1M
```

To boot the system from SD card on VisionCB-STM32MP1-STD board the BOOT jumpers must be set to 101.

## Installing eMMC image

To install the built system on eMMC memory the STM32CubeProgrammer has to be used. It is available to download from the STMicroelectronics website:
https://www.st.com/en/development-tools/stm32cubeprog.html

In order to program the module on VisionCB-STM32MP1-STD board, the BOOT jumpers need to be set to 000 to enable DFU boot. STM32CubeProgrammer should be connected by the USB cable connected to the USB-OTG socket. After programming the BOOT jumpers need to be set to 010 in order to run the installed system.

The details about using the STM32CubeProgrammer may be found on the ST wiki pages:

https://wiki.st.com/stm32mpu/wiki/STM32CubeProgrammer
https://wiki.st.com/stm32mpu/wiki/STM32CubeProgrammer_flashlayout


## Building the SDK

The SDK for the host system can be build by calling the bitbake command:

```shell
bitbake st-image-weston -c populate_sdk
```

The SDK installer (st-image-weston-openstlinux-weston-<MACHINE_NAME>-x86_64-toolchain-2.6-snapshot.sh) is located in the tmp-glibc/deploy/sdk directory.
