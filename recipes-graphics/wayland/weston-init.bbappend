FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
            file://weston.ini \
            file://weston_rotated.ini \
            file://somlabs_desktop.png \
            "
FILES_${PN} += " ${datadir}/weston "

do_install_append() {
    install -m 0644 ${WORKDIR}/somlabs_desktop.png ${D}${datadir}/weston/backgrounds/somlabs_desktop.png
}

do_install_append_stm32mp157a-visionsom-dsi-ph720128t003-emmc-mx() {
    install -m 0644 ${WORKDIR}/weston_rotated.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install_append_stm32mp157a-visionsom-dsi-rvt70hsmnwc00-emmc-mx() {
    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install_append_stm32mp157a-visionsom-dsi-sd-mx() {
    install -m 0644 ${WORKDIR}/weston_rotated.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install_append_stm32mp157a-visionsom-hdmi-emmc-mx() {
    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install_append_stm32mp157a-visionsom-hdmi-sd-mx() {
    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install_append_stm32mp157a-visionsom-rgb-emmc-mx() {
    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install_append_stm32mp157a-visionsom-rgb-sd-mx() {
    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

