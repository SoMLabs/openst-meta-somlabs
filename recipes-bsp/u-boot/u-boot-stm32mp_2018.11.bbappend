FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Defconfig-for-visionsom-basic.patch \
            file://0001-Added-ili9881c-driver-for-Powertip-PH720128T003.patch \
            file://0001-Added-missing-mipi_dsi.h-include-in-ilitek-ili9881-d.patch \
            "

