FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
            file://weston.ini \
            file://somlabs_desktop.png \
            "
FILES_${PN} += " ${datadir}/weston "

do_install_append() {
    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston
    install -m 0644 ${WORKDIR}/somlabs_desktop.png ${D}${datadir}/weston/backgrounds/somlabs_desktop.png
}

