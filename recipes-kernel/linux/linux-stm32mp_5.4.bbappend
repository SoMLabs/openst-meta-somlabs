FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-stm32mp1.git;protocol=http"
KERNEL_BRANCH = "v5.4-stm32mp-r2.1-somlabs"

SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH} \
           file://stm32mp157a_visionsom_mx_defconfig \
           "
SRCREV = "2d4ac28801aacc4c9b4f51573ed6e79589abc0aa"

S = "${WORKDIR}/git"

KERNEL_DEFCONFIG = ""
KERNEL_EXTERNAL_DEFCONFIG = "stm32mp157a_visionsom_mx_defconfig"
KERNEL_CONFIG_FRAGMENTS = ""
