# meta-somlabs

## Introduction

Meta-somlabs is a layer providing the VisionSOM-STM32MP1 module and VisionCB-STD-STM32MP1 carrier board hardware support for Yocto-based OpenSTLinux system.

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
DISTRO=openstlinux-weston MACHINE=stm32mp157a-visionsom-mx source layers/meta-st/scripts/envsetup.sh
bitbake st-image-weston
cd tmp-glibc/deploy/images/stm32mp157a-visionsom-mx/scripts/
./create_sdcard_from_flashlayout.sh ../flashlayout_st-image-weston/trusted/FlashLayout_sdcard_stm32mp157a-visionsom-mx-trusted.tsv
```

The system image is located in the FlashLayout_sdcard_stm32mp157a-visionsom-mx-trusted.raw file in the tmp-glibc/deploy/images/stm32mp157a-visionsom-mx directory.

The base image supports the RGB display interface. In order to build the image with the DSI support, the following configuration needs to be used:

```shell
DISTRO=openstlinux-weston MACHINE=stm32mp157a-visionsom-dsi-mx source layers/meta-st/scripts/envsetup.sh
bitbake st-image-weston
cd tmp-glibc/deploy/images/stm32mp157a-visionsom-dsi-mx/scripts/
./create_sdcard_from_flashlayout.sh ../flashlayout_st-image-weston/trusted/FlashLayout_sdcard_stm32mp157a-visionsom-dsi-mx-trusted.tsv
```

## Building the SDK

The SDK for the host system can be build by calling the bitbake command:

```shell
bitbake st-image-weston -c populate_sdk
```

The SDK installer (st-image-weston-openstlinux-weston-stm32mp157a-visionsom-mx-x86_64-toolchain-2.6-snapshot.sh) is located in the tmp-glibc/deploy/sdk directory.
