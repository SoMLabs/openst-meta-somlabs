FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://stm32mp15_visionsom_trusted_defconfig \
            file://0001-Fixed-ili9881c-driver-for-Powertip-PH720128T003.patch \
            file://0002-Boot-from-mmc0-only.patch \
            "

do_compile_prepend () {
	install -m 0644 ${WORKDIR}/stm32mp15_visionsom_trusted_defconfig ${S}/configs
}


