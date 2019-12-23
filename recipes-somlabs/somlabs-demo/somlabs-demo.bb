DESCRIPTION = "SoMLabs demo application"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"

DEPENDS += "wayland"
DEPENDS += "qtbase"
DEPENDS += "qtdeclarative"
DEPENDS += "gstreamer1.0"
DEPENDS += "gstreamer1.0-plugins-base"
DEPENDS += "gstreamer1.0-plugins-bad"

SRC_URI = " \
    file://SomlabsDemo \
    file://somlabs_demo_run.sh \
    "

M4V_VIDEO_URL = "http://mirror.cessen.com/blender.org/peach/trailer/trailer_iphone.m4v"

do_install() {

    install -d ${D}${prefix}/local/weston-start-at-startup/
    install -d ${D}${prefix}/local/SomlabsDemo/
    install -m 0755 ${WORKDIR}/somlabs_demo_run.sh ${D}${prefix}/local/weston-start-at-startup/somlabs_demo_run.sh
    install -m 0755 ${WORKDIR}/SomlabsDemo ${D}${prefix}/local/SomlabsDemo/SomlabsDemo
    wget ${M4V_VIDEO_URL} -O ${D}${prefix}/local/SomlabsDemo/video.m4v
}

FILES_${PN} = "${prefix}/local/SomlabsDemo/ ${prefix}/local/weston-start-at-startup/"
