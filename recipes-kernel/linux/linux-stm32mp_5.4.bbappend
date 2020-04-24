FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://stm32mp157a_visionsom_mx_defconfig \
            file://0001-Add-support-for-VisionSOM-STM32MP1-board.patch \
            file://0002-Uptated-ILI9881C-driver-for-Powertip-PH720128T003.patch \
            "


KERNEL_DEFCONFIG = ""
KERNEL_EXTERNAL_DEFCONFIG = "stm32mp157a_visionsom_mx_defconfig"

