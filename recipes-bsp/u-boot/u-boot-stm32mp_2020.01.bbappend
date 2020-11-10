FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/SoMLabs/somlabs-uboot-stm32mp1.git;protocol=http"
UBOOT_BRANCH = "v2020.01-stm32mp-somlabs"

SRC_URI = "${UBOOT_SRC};branch=${UBOOT_BRANCH} \
           file://stm32mp15_visionsom_trusted_defconfig \
           "
SRCREV = "90f7d7de81709bc483c1d12c56ccc602a7e3331c"

S = "${WORKDIR}/git"

do_compile_prepend () {
	install -m 0644 ${WORKDIR}/stm32mp15_visionsom_trusted_defconfig ${S}/configs
}


