FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Add-support-for-VisionSOM-STM32MP1-board.patch \
            file://0001-Add-defconfig-for-VisionSOM-STM32MP1-board.patch \
            "

KERNEL_DEFCONFIG        = "stm32mp157a_visionsom_mx_defconfig"
