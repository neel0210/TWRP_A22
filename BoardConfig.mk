#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a22x

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
  boot \
  system

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55
TARGET_USES_64_BIT_BINDER := true

TARGET_CPU_SMP := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := SRPTL28A009
TARGET_NO_BOOTLOADER := true
TW_NO_REBOOT_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_USES_UEFI := true
BOARD_VENDOR := samsung
TARGET_SOC := mt6833

### Board Flags
# CMDLINE
BOARD_KERNEL_CMDLINE :=  androidboot.selinux=permissive bootopt=64S3,32N2,64N2 loop.max_part=7
BOARD_KERNEL_CMDLINE := androidboot.init_fatal_reboot_target=recovery 

BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_KERNEL_SECOND_OFFSET := 0x07c00000

BOARD_BOOTIMG_HEADER_VERSION := 2

BOARD_MKBOOTIMG_ARGS += --board SRPTL28A009
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true

BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/bootimg.mk

# DTB
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# DTBO
BOARD_KERNEL_SEPARATED_DTBO := true

# Kernel Configs # TMP Disabled
# TARGET_KERNEL_CONFIG := a22x_defconfig
# TARGET_KERNEL_SOURCE := kernel/samsung/a22x

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 41943040
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 9122611200

# System as root
BOARD_ROOT_EXTRA_FOLDERS := cache carrier data_mirror efs keyrefuge linkerconfig metadata omr optics prism spu
BOARD_SUPPRESS_SECURE_ERASE := true

# Platform
TARGET_BOARD_PLATFORM := mt6833
TARGET_BOARD_PLATFORM_GPU := mali-g57

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
# TARGET_USERIMAGES_USE_EXT4 := true
# TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2127-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# TWRP Configuration
TW_DEVICE_VERSION := V0.2 by Neel0210
TW_THEME := portrait_hdpi
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2408
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_INCLUDE_NTFS_3G := true
TARGET_USES_MKE2FS := true
TW_EXCLUDE_APEX := true
TW_SUPPORT_INPUT_AIDL_HAPTICS := true
TW_NO_FASTBOOT_BOOT := true
TW_INCLUDE_LIBRESETPROP := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
TW_BACKUP_EXCLUSIONS := /data/fonts
TW_USE_TOOLBOX := true
TW_HAS_DOWNLOAD_MODE := true
TW_MTP_DEVICE := "Galaxy A22 5G"
TW_USE_NEW_MINADBD := true
TW_NO_LEGACY_PROPS := true
TW_NO_BIND_SYSTEM := true
TW_NO_SCREEN_BLANK := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

# Logcat
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

# Crypto
TW_INCLUDE_FBE_METADATA_DECRYPT := false
BOARD_USES_METADATA_PARTITION := true
TW_INCLUDE_CRYPTO_FBE := false
TW_INCLUDE_CRYPTO := false

# Device
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 80
TW_FRAMERATE := 90

# USB
TW_EXCLUDE_DEFAULT_USB_INIT := true

# StatusBar
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS := "300"
TW_CUSTOM_CLOCK_POS := "70"
TW_CUSTOM_BATTERY_POS := "790"

# Storage
RECOVERY_SDCARD_ON_DATA := true

# Fastboot
TW_INCLUDE_FASTBOOTD := true

# Make recovery image smaller
BOARD_HAS_NO_REAL_SDCARD := true

