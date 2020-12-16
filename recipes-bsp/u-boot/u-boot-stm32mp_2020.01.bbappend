FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/SoMLabs/somlabs-uboot-stm32mp1.git;protocol=http"
UBOOT_BRANCH = "v2020.01-stm32mp-r2-somlabs"

SRC_URI = "${UBOOT_SRC};branch=${UBOOT_BRANCH} \
           file://stm32mp15_visionsom_trusted_defconfig \
           "
SRCREV = "541bd1ecfcbbcb99189d678bc8e7c176dd3f8dce"

S = "${WORKDIR}/git"

do_configure_prepend () {
	install -m 0644 ${WORKDIR}/stm32mp15_visionsom_trusted_defconfig ${S}/configs
}


