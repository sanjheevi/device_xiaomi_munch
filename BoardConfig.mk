#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BOARD_VENDOR := xiaomi

DEVICE_PATH := device/xiaomi/munch
MUNCH_PREBUILT := device/xiaomi/munch-prebuilt

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo385

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo385

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kona

# Display
TARGET_SCREEN_DENSITY := 440

# Kernel
BOARD_BOOT_HEADER_VERSION := 3
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_BINARIES := kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 msm_rtb.filter=0x237 service_locator.enable=1 androidboot.usbcontroller=a600000.dwc3 swiotlb=2048 loop.max_part=7 cgroup.memory=nokmem,nosocket reboot=panic_warm 
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
TARGET_COMPILE_WITH_MSM_KERNEL := true
KERNEL_LD := LD=ld.lld
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc LLVM=1
TARGET_KERNEL_APPEND_DTB := false
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

TARGET_KERNEL_CONFIG := munch_defconfig
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_SOURCE := kernel/xiaomi/munch

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Partitions
BOARD_PREBUILT_ODMIMAGE := $(MUNCH_PREBUILT)/odm.img

BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions

BOARD_FLASH_BLOCK_SIZE := 262144

BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_DTBOIMG_PARTITION_SIZE := 33554432

BOARD_USERDATAIMAGE_PARTITION_SIZE := 113464291328
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296

BOARD_PARTITION_LIST := $(call to-upper, $(BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST))
$(foreach p, $(BOARD_PARTITION_LIST), $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := ext4))
$(foreach p, $(BOARD_PARTITION_LIST), $(eval TARGET_COPY_OUT_$(p) := $(call to-lower, $(p))))

BOARD_USES_METADATA_PARTITION := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := kona

# Recovery
TARGET_HAS_GENERIC_KERNEL_HEADERS := true
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_USES_RECOVERY_AS_BOOT := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# VNDK
BOARD_VNDK_VERSION := current