FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-stm32mp1.git;protocol=http"
KERNEL_BRANCH = "v5.4-stm32mp-somlabs"

SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH} \
           file://stm32mp157a_visionsom_mx_defconfig \
           "
SRCREV = "f5f72474d06b15def49c1d2bd3e5e101e0a52b0e"

S = "${WORKDIR}/git"

KERNEL_DEFCONFIG = ""
KERNEL_EXTERNAL_DEFCONFIG = "stm32mp157a_visionsom_mx_defconfig"
KERNEL_CONFIG_FRAGMENTS = ""
