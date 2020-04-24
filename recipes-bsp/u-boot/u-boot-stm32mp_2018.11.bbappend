FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Defconfig-for-visionsom-basic.patch \
            file://0001-Added-ili9881c-driver-for-Powertip-PH720128T003.patch \
            file://0001-Ilitek-ili9881-fixes-for-openstlinux-20-02-19.patch \
            file://0001-Added-trusted-visionsom-stm32mp-defconfig-file.patch \
            "

