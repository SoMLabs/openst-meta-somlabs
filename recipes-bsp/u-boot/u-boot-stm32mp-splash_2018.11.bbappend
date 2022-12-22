FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " file://somlabs_1024_600.bmp \
             file://somlabs_720_1280.bmp \
             file://somlabs_800_480.bmp \
           "

UBOOT_SPLASH_LANDSCAPE_SRC = "somlabs_1024_600.bmp"
UBOOT_SPLASH_PORTRAIT_SRC = "somlabs_720_1280.bmp"

UBOOT_SPLASH_LANDSCAPE_SRC:mp157a-rgb-ph-emmc-mx = "somlabs_800_480.bmp"
UBOOT_SPLASH_LANDSCAPE_SRC:mp157a-rgb-ph-sd-mx = "somlabs_800_480.bmp"
