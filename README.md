# meta-somlabs

## Introduction

Meta-somlabs is a layer providing the VisionSOM-STM32MP1 module and VisionCB-STM32MP1-STD carrier board hardware support for Yocto-based OpenSTLinux system.

## System image

This layer should be used in order to build the st-image-weston image.

## Building the system image

In order to build the system image a Distribution Package provided by STMicroelectronics is required. The whole building process is described on the ST wiki pages:

https://wiki.st.com/stm32mpu/wiki/STM32MP1_Distribution_Package

Yocto is using absolute directory path to give names to intermediate files. If the path is too long, Yocto build fails because file names exceed the maximum size 
supported by the file system. In that case, installation directory path should be renamed to reduce the overall absolute path name.

The summary of required steps is shown below:

```shell
mkdir st-yocto
cd st-yocto
repo init -u https://github.com/STMicroelectronics/oe-manifest -b refs/tags/openstlinux-6.6-yocto-scarthgap-mpu-v24.12.05
repo sync
cd layers/meta-st
git clone -b scarthgap https://github.com/SoMLabs/openst-meta-somlabs.git meta-somlabs
cd ../../
DISTRO=openstlinux-weston MACHINE=<MACHINE_NAME> source layers/meta-st/scripts/envsetup.sh
bitbake st-image-weston
```

The following VisionSOM machines are available:
* mp157a-dsi-rvt-emmc-mx VisionSOM-STM32MP1 eMMC module with VisionCB-STM32MP1-STD board and rvt70hsmnwc00 DSI display
* mp157a-hdmi-lt-emmc-mx VisionSOM-STM32MP1 eMMC module with VisionCB-STM32MP1-STD board and lt8912b HDMI bridge

The compiled image files are located in the directory:

```
st-yocto/build-openstlinuxweston-<MACHINE_NAME>/tmp-glibc/deploy/images/<MACHINE_NAME>
```

## Installing eMMC image

To install the built system on eMMC memory the STM32CubeProgrammer has to be used. It is available to download from the STMicroelectronics website:
https://www.st.com/en/development-tools/stm32cubeprog.html

In order to program the module on VisionCB-STM32MP1-STD board, the BOOT jumpers need to be set to 000 to enable DFU boot. STM32CubeProgrammer should be connected by the USB cable connected to the USB-OTG socket. After programming the BOOT jumpers need to be set to 010 in order to run the installed system.

The details about using the STM32CubeProgrammer may be found on the ST wiki pages:

https://wiki.st.com/stm32mpu/wiki/STM32CubeProgrammer
https://wiki.st.com/stm32mpu/wiki/STM32CubeProgrammer_flashlayout

