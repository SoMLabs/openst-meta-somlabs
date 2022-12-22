FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
        file://image_header.h \
        file://image_header_720_1280.h \
        file://image_header_800_480.h \
    "

SOMLABS_SPLASH_CFLAGS = "${@bb.utils.contains('MACHINE_FEATURES', 'dsi', 'USE_SOMLABS_SPLASH_720_1280', 'USE_SOMLABS_SPLASH_800_480', d)}"

EXTRA_OEMAKE = "CFLAGS+=-D${SOMLABS_SPLASH_CFLAGS}"

