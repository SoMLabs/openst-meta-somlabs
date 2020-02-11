FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " file://somlabs_720_1280.bmp \
             file://somlabs_800_480.bmp \
           "
FILES_${PN} += " ${datadir}/u-boot-stm32mp-splash "

UBOOT_SPLASH_SRC = "${@bb.utils.contains('MACHINE_FEATURES', 'dsi', 'somlabs_720_1280.bmp', 'somlabs_800_480.bmp', d)}"
UBOOT_SPLASH_IMAGE ?= "splash"

do_install_append() {
    install -m 0644 ${WORKDIR}/${UBOOT_SPLASH_SRC} ${D}/boot/${UBOOT_SPLASH_IMAGE}.bmp
}


