# BoardConfig.mk
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#
#*****A SINGLE ERROR IN EDITING THIS FILE MAY RESULT IN BRICKING YOUR STAR PRO S7262*****

##############################         WRITTEN          ##############################
##############################           BY             ##############################
##############################       regalstreak        ##############################
##############################      (NEIL AGARWAL)      ##############################
##############################     PLEASE JOIN THE      ##############################
##############################  SAMSUNG GALAXY STAR PRO ##############################
##############################      FACEBOOK GROUP      ##############################
#                        http://www.facebook.com/groups/S7262/

# inherit from the proprietary version
-include vendor/samsung/logan2g/logan2g-vendor-blobs.mk

TARGET_OTA_ASSERT_DEVICE := logan2g

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a5
TARGET_CPU_VARIANT := cortex-a5
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
ARCH_ARM_HAVE_TLS_REGISTER := true
##TARGET_CORTEX_CACHE_LINE_32 := true

# Board
TARGET_BOOTLOADER_BOARD_NAME := logan2g
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM := sc6820i
##COMMON_GLOBAL_CFLAGS += -DSPRD_HARDWARE

# Kernel
# THE KERNEL USED IS FROM STOCK ROM S7262XXUAND5  //Get the full ROM @ http://gg.gg/XXUAND5/ (Google Drive Mirror)
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
HAS_PREBUILT_KERNEL := true
##TARGET_KERNEL_SOURCE := kernel/samsung/logan2g           //Not using source as of now
##TARGET_KERNEL_CONFIG := cyanogenmod_logan2g_defconfig    //Using a prebuilt kernel 
BOARD_USES_UNCOMPRESSED_BOOT := true
TARGET_PREBUILT_KERNEL := device/samsung/logan2g/kernel

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 941621248
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2630614528
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Partition Mountpoints
BOARD_RECOVERY_DEVICE := /dev/block/mmcblk0p6
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p9
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p8
BOARD_CACHE_FILESYSTEM := ext4
BOARD_DATA_DEVICE := /dev/block/mmcblk0p12
BOARD_DATA_FILESYSTEM := ext4

# Recovery
##BOARD_LDPI_RECOVERY := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := "<roboto_15x24.h>"
DEVICE_RESOLUTION := 480x800
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800
##BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/logan2g/recovery/recovery_keys.c
#//No need of this :P
TARGET_RECOVERY_INITRC := device/samsung/logan2g/recovery/recovery.rc
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/logan2g/recovery/graphics.c
BOARD_HAS_NO_MISC_PARTITION := true
TARGET_RECOVERY_FSTAB := device/samsung/logan2g/recovery.fstab
BOARD_SUPPRESS_EMMC_WIPE := true
##BOARD_TOUCH_RECOVERY := true
#//Will need the ../vendor/koush/recovery/touch.c file which is not available...
#//This file is closed source :(
#//If you want to build a touch version, then use the CWM online builder...
#ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
#ADDITIONAL_DEFAULT_PROPERTIES += ro.debuggable=1
#ADDITIONAL_DEFAULT_PROPERTIES += service.adb.root=1
#ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=adb
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0 \
ro.debuggable=1 \
service.adb.root=1

# UMS   //First chmod 777 to these fles in your mobile...
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/dwc_otg.0/gadget/lun0/file"

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/samsung/logan2g/egl/egl.cfg
BOARD_EGL_NEEDS_LEGACY_FB := true
BUILD_EMULATOR_OPENGL := true

# Camera
USE_CAMERA_STUB := true

# Audio
HAVE_HTC_AUDIO_DRIVER := true
BOARD_USES_GENERIC_AUDIO := true
BOARD_USE_SAMSUNG_SEPARATEDSTREAM := true
BOARD_USES_LIBMEDIA_WITH_AUDIOPARAMETER := true
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/logan2g/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/logan2g/bluetooth/libbt_vndcfg.txt

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Connectivity - Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WLAN_DEVICE_REV       := bcm4330
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME     := "dhd"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_BAND                   := 802_11_ABG

# Wi-Fi Tethering
BOARD_HAVE_SAMSUNG_WIFI := true
BOARD_LEGACY_NL80211_STA_EVENTS := true
BOARD_NO_APSME_ATTR := true

# ODEX
WITH_DEXPREOPT=true

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/logan2g/ril/

# PHILZ RECOVERY
##PHILZ_TOUCH_RECOVERY := true  //Will compile later
