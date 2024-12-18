FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
            file://weston.ini \
            file://somlabs_desktop.png \
            "
FILES:${PN} += " ${datadir}/weston "

do_install:append() {
    install -m 0644 ${WORKDIR}/somlabs_desktop.png ${D}${datadir}/weston/backgrounds/somlabs_desktop.png
    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

