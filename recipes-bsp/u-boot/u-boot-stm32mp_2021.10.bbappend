FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/SoMLabs/somlabs-uboot-stm32mp1.git;protocol=http"
UBOOT_BRANCH = "v2021.10-stm32mp-somlabs"

SRC_URI = "${UBOOT_SRC};branch=${UBOOT_BRANCH} \
           file://stm32mp15_visionsom_trusted_defconfig \
           "
SRCREV = "4681ff929b2d9c0aa687f0444bcd0a28bd195824"

S = "${WORKDIR}/git"

do_configure:prepend () {
	install -m 0644 ${WORKDIR}/stm32mp15_visionsom_trusted_defconfig ${S}/configs
}

