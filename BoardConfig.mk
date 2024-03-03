#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/motorola/lake

# Inherit from motorola sdm660-common
-include device/motorola/sdm660-common/BoardConfigCommon.mk

# A/B updater
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    vendor

# Assertions
TARGET_BOARD_INFO_FILE := device/motorola/lake/configs/board-info.txt
TARGET_OTA_ASSERT_DEVICE := lake,lake_n

# Display
TARGET_SCREEN_DENSITY := 420

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/vintf/lake_manifest.xml

# Init
SOONG_CONFIG_NAMESPACES += MOTOROLA_SDM660_INIT
SOONG_CONFIG_MOTOROLA_SDM660_INIT := DEVICE_LIB
SOONG_CONFIG_MOTOROLA_SDM660_INIT_DEVICE_LIB := //$(DEVICE_PATH):libinit_lake

# Kernel
BOARD_BOOT_HEADER_VERSION := 1
BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc/c0c4000.sdhci
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
TARGET_KERNEL_CONFIG := lake_defconfig

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864 # 64 MB
BOARD_DTBOIMG_PARTITION_SIZE := 16777216 # 16 MB

# Partitions dynamic
BOARD_SUPER_PARTITION_GROUPS := moto_dynamic_partitions
BOARD_SUPER_PARTITION_BLOCK_DEVICES := system vendor
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 2969567232 # 2832 MB
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 939524096 # 896 MB
BOARD_MOTO_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor
BOARD_SUPER_PARTITION_SIZE := 3909091328 # 3728 MB
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_MOTO_DYNAMIC_PARTITIONS_SIZE := 3904897024 # 3724 MB

# Power
TARGET_HAS_NO_WLAN_STATS := true

# Properties
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/properties/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop

# Recovery
TARGET_RECOVERY_UI_BLANK_UNBLANK_ON_INIT := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# This flag needs to be set first
BOARD_USES_KEYMASTER_4 := true

# inherit from the proprietary version
include vendor/motorola/lake/BoardConfigVendor.mk
