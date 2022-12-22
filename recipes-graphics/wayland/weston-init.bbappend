FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
            file://weston.ini \
            file://weston_rotated.ini \
            file://somlabs_desktop.png \
            "
FILES:${PN} += " ${datadir}/weston "

WESTON_INI_FILE = "${@'weston.ini' if d.getVar('DISPLAY_ORIENTATION') == 'landscape' \
                     else 'weston_rotated.ini'}"

do_install:append() {
    install -m 0644 ${WORKDIR}/somlabs_desktop.png ${D}${datadir}/weston/backgrounds/somlabs_desktop.png
    install -m 0644 ${WORKDIR}/${WESTON_INI_FILE} ${D}${sysconfdir}/xdg/weston/weston.ini
}

