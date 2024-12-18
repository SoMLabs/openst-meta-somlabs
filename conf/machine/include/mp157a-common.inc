###########################################################################
#
# Default machine configuration sections
#
###########################################################################

include conf/machine/include/st-machine-common-stm32mp.inc
include conf/machine/include/st-machine-providers-stm32mp.inc

# Define specific common machine name
MACHINEOVERRIDES .= ":stm32mpcommonmx:stm32mp15commonmx"
MACHINEOVERRIDES .= ":stm32mp1common:stm32mp15common:"
MACHINEOVERRIDES .= ":stm32mpvisionsommx"
MACHINEOVERRIDES .= ":stm32mpsomlabscommon"

DEVICE_STORAGE:stm32mpsomlabscommon = "EMMC:mmc0, NAND:nand0, NOR:nor0, SDCARD:mmc1, SPINAND:spi-nand0"

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
BOOTDEVICE_LABELS = "emmc"

# =========================================================================
# Machine settings
# =========================================================================
STM32MP_DT_FILES_NAND    += "${CUBEMX_DTB}"
STM32MP_DT_FILES_NOR     += "${CUBEMX_DTB}"
STM32MP_DT_FILES_EMMC    += "${CUBEMX_DTB}"
STM32MP_DT_FILES_SDCARD  += "${CUBEMX_DTB}"
STM32MP_DT_FILES_SPINAND += "${CUBEMX_DTB}"

# =========================================================================
# Machine features (default for stm32mp1 like)
# =========================================================================
MACHINE_FEATURES += "splashscreen"
MACHINE_FEATURES += "watchdog"
MACHINE_FEATURES += "${@'gpu' if d.getVar('ACCEPT_EULA_'+d.getVar('MACHINE')) == '1' else ''}"
MACHINE_FEATURES += "m4copro"

# =========================================================================
# Flashlayout
# =========================================================================
# Set the FLASHLAYOUT_TYPE_LABELS for 'extensible' to CUBEMX_DTB
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

BOOTSCHEME_LABELS += "optee"

# Bootloader config file
UBOOT_CONFIG[trusted_stm32mp15] = "stm32mp15_visionsom_trusted_defconfig,,u-boot.dtb"

# Define the features to enable on board
MACHINE_FEATURES += "bluetooth"
MACHINE_FEATURES += "wifi"

# Set the list of kernel module to be auto-loaded during boot
#KERNEL_MODULE_AUTOLOAD += ""

# Set Bluetooth related package list needed when 'bluetooth' feature is enabled
BLUETOOTH_LIST += "linux-firmware-bluetooth-bcm43xx"

# Set Wifi related package list needed when 'wifi' feature is enabled
WIFI_LIST += "linux-firmware-bcm43430"

# Indicate which STM32MP package are used: 'A', 'C', 'D' or 'F'
CUBEMX_SOC_PACKAGE = "A"

# Indicate the size of DDR available on BOARD: 512 or 1024 (size in MB unit)
CUBEMX_BOARD_DDR_SIZE = "512"

# Indicate if you like to disable the DVFS which are activated by default
CUBEMX_SOC_DVFS_OFF = "0"

