###########################################################################
#
# Default machine configuration sections
#
###########################################################################

include conf/machine/include/st-machine-common-stm32mp.inc
include conf/machine/include/st-machine-providers-stm32mp.inc

# Define specific common machine name
MACHINEOVERRIDES .= ":stm32mpcommonmx:stm32mp15commonmx"
MACHINEOVERRIDES .= ":stm32mp1common:stm32mp15common"
MACHINEOVERRIDES .= ":stm32mpvisionsommx"

# =========================================================================
# Chip architecture
# =========================================================================
DEFAULTTUNE = "cortexa7thf-neon-vfpv4"
include conf/machine/include/arm/armv7a/tune-cortexa7.inc

# =========================================================================
# boot scheme
# =========================================================================
BOOTSCHEME_LABELS ?= ""

# =========================================================================
# boot device
# =========================================================================
BOOTDEVICE_LABELS ?= ""

# =========================================================================
# Machine settings
# =========================================================================
STM32MP_DEVICETREE = "${CUBEMX_DTB}"

# =========================================================================
# Machine features (default for stm32mp1 like)
# =========================================================================
MACHINE_FEATURES += "splashscreen"
MACHINE_FEATURES += "watchdog"
MACHINE_FEATURES += "${@'gpu' if d.getVar('ACCEPT_EULA_'+d.getVar('MACHINE')) == '1' else ''}"
MACHINE_FEATURES += "m4copro"

# =========================================================================
# Device Storage
# =========================================================================
# Enable the board device storage support with CUBEMX_DTB according to BOOTDEVICE_LABELS
DEVICE_BOARD_ENABLE:NAND    += "${@bb.utils.contains('BOOTDEVICE_LABELS', 'nand-4-256', '${CUBEMX_DTB}', '', d)}"
DEVICE_BOARD_ENABLE:NOR     += "${@bb.utils.contains('BOOTDEVICE_LABELS', 'nor-sdcard' , '${CUBEMX_DTB}', '', d)}"
DEVICE_BOARD_ENABLE:EMMC    += "${@bb.utils.contains('BOOTDEVICE_LABELS', 'emmc', '${CUBEMX_DTB}', '', d)}"
DEVICE_BOARD_ENABLE:SDCARD  += "${@bb.utils.contains('BOOTDEVICE_LABELS', 'sdcard', '${CUBEMX_DTB}', '', d)}"

# =========================================================================
# Flashlayout
# =========================================================================
# Set the FLASHLAYOUT_TYPE_LABELS to CUBEMX_DTB according to BOOTDEVICE_LABELS
FLASHLAYOUT_TYPE_LABELS:emmc        = "${@bb.utils.contains('BOOTDEVICE_LABELS', 'emmc', '${CUBEMX_DTB}', '', d)}"
FLASHLAYOUT_TYPE_LABELS:nand-4-256  = "${@bb.utils.contains('BOOTDEVICE_LABELS', 'nand-4-256', '${CUBEMX_DTB}', '', d)}"
FLASHLAYOUT_TYPE_LABELS:nor-sdcard  = "${@bb.utils.contains('BOOTDEVICE_LABELS', 'nor-sdcard' , '${CUBEMX_DTB}', '', d)}"
FLASHLAYOUT_TYPE_LABELS:sdcard      = "${@bb.utils.contains('BOOTDEVICE_LABELS', 'sdcard', '${CUBEMX_DTB}', '', d)}"

# Specific settings for 'extensible' and 'deleteall' configurations
FLASHLAYOUT_CONFIG_LABELS:deleteall = "cubemx"
FLASHLAYOUT_TYPE_LABELS:deleteall:cubemx = "${CUBEMX_DTB}"
FLASHLAYOUT_TYPE_LABELS:extensible = "${CUBEMX_DTB}"

# =========================================================================
# CubeMX extra config
# =========================================================================
ENABLE_CUBEMX_DTB ?= "1"

###########################################################################
#
# User machine customization sections
#
###########################################################################

UBOOT_EXTLINUX_SPLASH = "${@'${UBOOT_SPLASH_LANDSCAPE_IMAGE}' if d.getVar('DISPLAY_ORIENTATION') == 'landscape' \
                           else '${UBOOT_SPLASH_PORTRAIT_IMAGE}'}"

BOOTSCHEME_LABELS += "trusted"

# Bootloader config file
UBOOT_CONFIG[trusted_stm32mp15] = "stm32mp15_visionsom_trusted_defconfig,,u-boot.dtb"

# Define the features to enable on board
MACHINE_FEATURES += "bluetooth"
MACHINE_FEATURES += "wifi"

# Set the list of kernel module to be auto-loaded during boot
#KERNEL_MODULE_AUTOLOAD += ""

# Set Bluetooth related package list needed when 'bluetooth' feature is enabled
BLUETOOTH_LIST += "linux-firmware-bluetooth-bcm4343"

# Set Wifi related package list needed when 'wifi' feature is enabled
WIFI_LIST += "linux-firmware-bcm43430"

# Indicate which STM32MP package are used: 'A', 'C', 'D' or 'F'
CUBEMX_SOC_PACKAGE = "A"

# Indicate the size of DDR available on BOARD: 512 or 1024 (size in MB unit)
CUBEMX_BOARD_DDR_SIZE = "512"

# Indicate if you like to disable the DVFS which are activated by default
CUBEMX_SOC_DVFS_OFF = "0"

