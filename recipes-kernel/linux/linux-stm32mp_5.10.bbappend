FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-stm32mp1.git;protocol=http"
KERNEL_BRANCH = "v5.10-stm32mp-somlabs"

SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH} \
           file://stm32mp157a_visionsom_mx_defconfig \
           "
SRCREV = "7487996f87b91665f0d243d7b96070412def83b9"

S = "${WORKDIR}/git"

KERNEL_DEFCONFIG = ""
KERNEL_EXTERNAL_DEFCONFIG = "stm32mp157a_visionsom_mx_defconfig"
KERNEL_CONFIG_FRAGMENTS = ""
