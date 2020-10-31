# Copyright (C) 2020 Paranoid Android
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

DEVICE_PATH := device/oneplus/oneplus8

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    odm \
    product \
    recovery \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2

BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76

# Audio
BOARD_SUPPORTS_OPENSOURCE_STHAL := false

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kona

# Biometrics
BOARD_FINGERPRINT_VENDOR := goodix.fod

# DTB
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# DTBO
BOARD_KERNEL_SEPARATED_DTBO := true

# Display
TARGET_SCREEN_DENSITY := 420

# GPS
include hardware/qcom/gps/gps_vendor_board.mk

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := vendor/qcom/opensource/core-utils/vendor_framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE := \
    $(DEVICE_PATH)/manifest.xml \
    $(DEVICE_PATH)/oneplus_manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

# Hacks
BUILD_BROKEN_DUP_RULES := true

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_oneplus8

# Kernel
BOARD_KERNEL_CMDLINE := \
    androidboot.console=ttyMSM0 \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.selinux=permissive \
    androidboot.usbcontroller=a600000.dwc3 \
    cgroup.memory=nokmem,nosocket \
    console=ttyMSM0,115200n8 \
    earlycon=msm_geni_serial,0xa90000 \
    loop.max_part=7 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    reboot=panic_warm \
    service_locator.enable=1 \
    swiotlb=2048 \
    video=vfb:640x400,bpp=32,memsize=3072000

BOARD_DO_NOT_STRIP_VENDOR_MODULES := true
BOARD_VENDOR_KERNEL_MODULES := \
    $(KERNEL_MODULES_OUT)/adsp_loader_dlkm.ko \
    $(KERNEL_MODULES_OUT)/apr_dlkm.ko \
    $(KERNEL_MODULES_OUT)/bolero_cdc_dlkm.ko \
    $(KERNEL_MODULES_OUT)/gspca_main.ko \
    $(KERNEL_MODULES_OUT)/hdmi_dlkm.ko \
    $(KERNEL_MODULES_OUT)/lcd.ko \
    $(KERNEL_MODULES_OUT)/llcc_perfmon.ko \
    $(KERNEL_MODULES_OUT)/machine_dlkm.ko \
    $(KERNEL_MODULES_OUT)/mbhc_dlkm.ko \
    $(KERNEL_MODULES_OUT)/mpq-adapter.ko \
    $(KERNEL_MODULES_OUT)/mpq-dmx-hw-plugin.ko \
    $(KERNEL_MODULES_OUT)/msm_11ad_proxy.ko \
    $(KERNEL_MODULES_OUT)/native_dlkm.ko \
    $(KERNEL_MODULES_OUT)/pinctrl_lpi_dlkm.ko \
    $(KERNEL_MODULES_OUT)/pinctrl_wcd_dlkm.ko \
    $(KERNEL_MODULES_OUT)/platform_dlkm.ko \
    $(KERNEL_MODULES_OUT)/q6_dlkm.ko \
    $(KERNEL_MODULES_OUT)/q6_notifier_dlkm.ko \
    $(KERNEL_MODULES_OUT)/q6_pdr_dlkm.ko \
    $(KERNEL_MODULES_OUT)/rdbg.ko \
    $(KERNEL_MODULES_OUT)/rx_macro_dlkm.ko \
    $(KERNEL_MODULES_OUT)/snd_event_dlkm.ko \
    $(KERNEL_MODULES_OUT)/stub_dlkm.ko \
    $(KERNEL_MODULES_OUT)/swr_ctrl_dlkm.ko \
    $(KERNEL_MODULES_OUT)/swr_dlkm.ko \
    $(KERNEL_MODULES_OUT)/tfa9894_dlkm.ko \
    $(KERNEL_MODULES_OUT)/tx_macro_dlkm.ko \
    $(KERNEL_MODULES_OUT)/usf_dlkm.ko \
    $(KERNEL_MODULES_OUT)/va_macro_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd938x_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd938x_slave_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd9xxx_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd_core_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wigig_sensing.ko \
    $(KERNEL_MODULES_OUT)/wil6210.ko \
    $(KERNEL_MODULES_OUT)/wsa881x_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wsa_macro_dlkm.ko

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000

# Metadata
BOARD_USES_METADATA_PARTITION := true

# OTA
TARGET_OTA_ASSERT_DEVICE := OnePlus8,OnePlus8Pro,oneplus8,oneplus8pro

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x6000000
BOARD_DTBOIMG_PARTITION_SIZE := 0x1800000
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x6400000

BOARD_SUPER_PARTITION_SIZE := 15032385536
BOARD_SUPER_PARTITION_GROUPS := oneplus_dynamic_partitions
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_SIZE := 7511998464

BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_DEVICE_MODULES := libinit_oneplus8
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_F2FS := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy/vendor

# VNDK
BOARD_VNDK_VERSION := current

# WLAN
include device/qcom/wlan/kona/BoardConfigWlan.mk

BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION := VER_0_8_X
