FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " file://somlabs_1024_600.bmp \
             file://somlabs_720_1280.bmp \
             file://somlabs_800_480.bmp \
           "
FILES_${PN} += " ${datadir}/u-boot-stm32mp-splash "

UBOOT_SPLASH_SRC_stm32mp157a-visionsom-dsi-ph720128t003-emmc-mx = "somlabs_720_1280.bmp"
UBOOT_SPLASH_SRC_stm32mp157a-visionsom-dsi-rvt70hsmnwc00-emmc-mx = "somlabs_1024_600.bmp"
UBOOT_SPLASH_SRC_stm32mp157a-visionsom-dsi-sd-mx = "somlabs_720_1280.bmp"
UBOOT_SPLASH_SRC_stm32mp157a-visionsom-hdmi-emmc-mx = "somlabs_1024_600.bmp"
UBOOT_SPLASH_SRC_stm32mp157a-visionsom-hdmi-sd-mx = "somlabs_1024_600.bmp"
UBOOT_SPLASH_SRC_stm32mp157a-visionsom-rgb-emmc-mx = "somlabs_800_480.bmp"
UBOOT_SPLASH_SRC_stm32mp157a-visionsom-rgb-sd-mx = "somlabs_800_480.bmp"

UBOOT_SPLASH_IMAGE ?= "splash"

do_install_append() {
    install -m 0644 ${WORKDIR}/${UBOOT_SPLASH_SRC} ${D}/boot/${UBOOT_SPLASH_IMAGE}.bmp
}


