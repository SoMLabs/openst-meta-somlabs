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
    file://src/ \
    file://somlabs_demo_run.sh \
    file://somlabs.png \
    http://ftp.somlabs.com/VisionSOM-STM32MP1/SoMLabs-STM32MP1-vdemo-2020-05.mp4 \
    "

SRC_URI[sha256sum] = "1ce4f78065fa73eb0c0fd2714501f5657d63036c3bf5619465e376eddd68cddf"

inherit qmake5

S = "${WORKDIR}/src"

do_install() {
    install -d ${D}${prefix}/local/somlabs-demo/
    install -m 0755 ${WORKDIR}/somlabs_demo_run.sh ${D}${prefix}/local/somlabs-demo/somlabs_demo_run.sh
    install -m 0644 ${WORKDIR}/somlabs.png ${D}${prefix}/local/somlabs-demo/somlabs.png
    install -m 0644 ${WORKDIR}/SoMLabs-STM32MP1-vdemo-2020-05.mp4 ${D}${prefix}/local/somlabs-demo/example_video.mp4
    install -m 0755 somlabs-demo ${D}${prefix}/local/somlabs-demo/somlabs-demo
}

FILES:${PN} = "${prefix}/local/somlabs-demo/ "
