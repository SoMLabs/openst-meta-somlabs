FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://stm32mp15_visionsom_basic_defconfig \
            file://stm32mp15_visionsom_trusted_defconfig \
            file://0001-Added-ili9881c-driver-for-Powertip-PH720128T003.patch \
            file://0001-Ilitek-ili9881-fixes-for-openstlinux-20-02-19.patch \
            file://0001-Boot-from-mmc0-only.patch \
            "

do_compile_prepend () {
	install -m 0644 ${WORKDIR}/stm32mp15_visionsom_basic_defconfig ${S}/configs
	install -m 0644 ${WORKDIR}/stm32mp15_visionsom_trusted_defconfig ${S}/configs
}

