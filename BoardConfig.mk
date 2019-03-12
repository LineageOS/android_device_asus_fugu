# Copyright 2013-2018 The Android Open-Source Project
# Copyright 2015-2020 The LineageOS Project
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

DEVICE_PATH := device/asus/fugu

## Use the non-open-source parts, if they're present
-include device/intel/common/external/external.mk
-include vendor/asus/fugu/BoardConfigVendor.mk
-include vendor/intel/fugu/BoardConfigVendor.mk
-include vendor/asus/fugu/BoardConfigVendor.mk

## Architecture
TARGET_ARCH := x86
TARGET_ARCH_VARIANT := silvermont
TARGET_CPU_ABI := x86
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_ABI_LIST := x86,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := x86,armeabi-v7a,armeabi

## Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TINY_ALSA_AUDIO := true

## Binder
TARGET_USES_64_BIT_BINDER := true

## Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

## Board
TARGET_BOARD_PLATFORM := moorefield
TARGET_BOOTLOADER_BOARD_NAME := fugu

## Bootstub (2nd bootloader)
TARGET_BOOTLOADER_IS_2ND := true

## Dex
# Don't dex preopt prebuilt apps that will be updated from Play Store
DONT_DEXPREOPT_PREBUILTS := true
# Don't uncompress dex files in priv apps APKs to save on space.
DONT_UNCOMPRESS_PRIV_APPS_DEXS := true

## DRM Protected Video
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1
USE_INTEL_SECURE_AVC := true

## DroidBoot
TARGET_DROIDBOOT_LIBS := libintel_droidboot

## Fonts
EXCLUDE_SERIF_FONTS := true

## Graphics
BOARD_EGL_CFG := $(DEVICE_PATH)/gpu/egl.cfg
BOARD_GFX_REV := RGX6400
BOARD_USES_LIBDRM := true
ENABLE_IMG_GRAPHICS := true
ENABLE_MRFL_GRAPHICS := true
HWUI_IMG_FBO_CACHE_OPTIM := true
# DPST
INTEL_DPST := true
INTEL_HWC_MOOREFIELD_HDMI := true
INTEL_VA := true
MAX_EGL_CACHE_ENTRY_SIZE := 65536
MAX_EGL_CACHE_SIZE := 1048576
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libPVRRS.so
SF_START_GRAPHICS_ALLOCATOR_SERVICE := true
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000
TARGET_SUPPORT_HDMI_PRIMARY := true
TARGET_USES_HWC2 := true
# Enabled to carry out all drawing operations performed
# on a View's canvas with GPU for 2D rendering pipeline
USE_OPENGL_RENDERER := true
# System's VSYNC phase offsets in nanoseconds
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000

## HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

## Houdini
# Enable ARM codegen for x86 with Houdini
BUILD_ARM_FOR_X86 := true

# Kernel
BOARD_KERNEL_CMDLINE := pci=noearly vmalloc=256M ptrace.ptrace_can_access=1
BOARD_KERNEL_CMDLINE += earlyprintk=nologger loglevel=8
BOARD_KERNEL_CMDLINE += androidboot.hardware=fugu androidboot.serialno=01234567890123456789
BOARD_KERNEL_CMDLINE += snd_pcm.maximum_substreams=8
BOARD_KERNEL_CMDLINE += intel_soc_pmu.enable_s3=0
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_IMAGE_NAME := bzImage
TARGET_KERNEL_ARCH := x86_64
TARGET_KERNEL_CONFIG := lineage_fugu_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := x86_64-linux-android-
TARGET_KERNEL_SOURCE := kernel/asus/fugu

## Legacy
MALLOC_SVELTE := true

## Media
# Sets IPP library optimization to use
MFX_IPP := p8
# Use Media SDK support or not
USE_MEDIASDK := true

# OMX
BUILD_WITH_FULL_STAGEFRIGHT := true
BOARD_USES_VIDEO := true
BOARD_USES_MRST_OMX := true
BOARD_USES_WRS_OMXIL_CORE := true
USE_HW_VP8 := true
TARGET_HAS_ISV := true

## Partitions
BOARD_FLASH_BLOCK_SIZE := 2048
BOARD_CACHEIMAGE_PARTITION_SIZE := 260014080
# As of 3562118, inode usage was 2149, use 4096 to be safe
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := 4096
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
TARGET_USERIMAGES_USE_EXT4 := true

## Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

## Recovery
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_UI_LIB := librecovery_ui_fugu
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_fugu
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools

## Security
BUILD_WITH_CHAABI_SUPPORT := true
BUILD_WITH_SECURITY_FRAMEWORK := chaabi_token

## SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

## Wi-Fi
BOARD_HOSTAPD_PRIVATE_LIB  := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA := "/vendor/firmware/fw_bcmdhd.bin"
WPA_SUPPLICANT_VERSION := VER_0_8_X
