#
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

# Inherit proprietary-files
$(call inherit-product-if-exists, vendor/intel/PRIVATE/fugu/device-vendor.mk)
$(call inherit-product-if-exists, vendor/intel/moorefield/prebuilts/houdini/houdini.mk)

## AAPT
PRODUCT_AAPT_CONFIG := normal large xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

## Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.fugu \
    audio.r_submix.default \
    audio.stub.default \
    audio.usb.default \
    libaudio-resampler \
    libtinyalsa

## Audio Effects
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl

## Audio Policy
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

## Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    bt_bcm4354 \
    libbt-vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

## Characteristics
PRODUCT_CHARACTERISTICS := nosdcard,tv

## Codecs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/codec_resources_limitation.xml:system/etc/codec_resources_limitation.xml \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/media/mfx_omxil_core.conf:system/etc/mfx_omxil_core.conf \
    $(LOCAL_PATH)/media/video_isv_profile.xml:system/etc/video_isv_profile.xml \
    $(LOCAL_PATH)/media/wrs_omxil_components.list:system/etc/wrs_omxil_components.list \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_tv.xml:system/etc/media_codecs_google_tv.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

## Dalvik
$(call inherit-product-if-exists, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

## DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    libdrm \
    dristat \
    drmstat

## Dumpstate
PRODUCT_PACKAGES += \
    android.hardware.dumpstate@1.0-service.fugu

## Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \
    IMG_graphics \
    hwcomposer.moorefield \
    libion

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gpu/powervr.ini:system/etc/powervr.ini

## HDMI-CEC
PRODUCT_PACKAGES += \
    android.hardware.tv.cec@1.0-impl

## Houdini
# Set the prop to enable arm native bridge
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.dalvik.vm.native.bridge=libhoudini.so

## HWUI
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.hwui.drop_shadow_cache_size=4.0 \
    ro.hwui.gradient_cache_size=0.8 \
    ro.hwui.layer_cache_size=32.0 \
    ro.hwui.path_cache_size=24.0 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.texture_cache_size=48.0 \
    ro.hwui.text_large_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_small_cache_height=512 \
    ro.hwui.text_small_cache_width=1024

## Intel
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.intel.isv.frc=1 \
    persist.intel.isv.vpp=1

## Kernel
KERNEL_SRC_DIR ?= linux/kernel-fugu
KERNEL_CFG_NAME ?= fugu
TARGET_KERNEL_ARCH ?= x86_64
# Check for availability of kernel source
ifneq ($(wildcard $(KERNEL_SRC_DIR)/Makefile),)
  # Give precedence to TARGET_PREBUILT_KERNEL
  ifeq ($(TARGET_PREBUILT_KERNEL),)
    TARGET_KERNEL_BUILT_FROM_SOURCE := true
  endif
endif
ifneq ($(TARGET_KERNEL_BUILT_FROM_SOURCE), true)
# Use prebuilt kernel
  ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := $(LOCAL_PATH)-kernel/bzImage
  else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
  endif
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
endif #TARGET_KERNEL_BUILT_FROM_SOURC

## Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayouts/Generic.kl:system/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/keylayouts/gpio-keys.idc:system/usr/idc/gpio-keys.idc \
    $(LOCAL_PATH)/keylayouts/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayouts/gpio-keys.kcm:system/usr/keychars/gpio-keys.kcm \
    $(LOCAL_PATH)/keylayouts/Nexus_Remote.idc:system/usr/idc/Nexus_Remote.idc \
    $(LOCAL_PATH)/keylayouts/Nexus_Remote.kl:system/usr/keylayout/Nexus_Remote.kl \
    $(LOCAL_PATH)/keylayouts/Spike.kl:system/usr/keylayout/Spike.kl

## Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

## Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl

## OMX
PRODUCT_PACKAGES += \
    libgabi++-mfx \
    libisv_omx_core \
    libmfxsw32 \
    libmfx_omx_core \
    libmfx_omx_components_sw \
    libmixvbp_mpeg4 \
    libmixvbp_h264 \
    libmixvbp_h264secure \
    libmixvbp_vc1 \
    libmixvbp_vp8 \
    libmixvbp_mpeg2 \
    libmixvbp \
    libOMXVideoDecoderAVC \
    libOMXVideoDecoderH263 \
    libOMXVideoDecoderMPEG2 \
    libOMXVideoDecoderMPEG4 \
    libOMXVideoDecoderWMV \
    libOMXVideoDecoderVP8 \
    libOMXVideoDecoderVP9HWR \
    libOMXVideoDecoderVP9Hybrid \
    libOMXVideoEncoderAVC \
    libOMXVideoEncoderH263 \
    libOMXVideoEncoderMPEG4 \
    libOMXVideoEncoderVP8 \
    libstlport-mfx \
    libva_videodecoder \
    libva_videoencoder \
    libwrs_omxil_common \
    libwrs_omxil_core_pvwrapped

## OpenGL
# For additional app compatibility in the Play Store
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196609

## Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

## Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version-1_0_3.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

## Power
PRODUCT_PACKAGES += \
    power.fugu \
    android.hardware.power@1.0-impl

## Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.fugu:root/fstab.fugu \
    $(LOCAL_PATH)/rootdir/init.fugu.rc:root/init.fugu.rc \
    $(LOCAL_PATH)/rootdir/init.fugu.countrycode.sh:system/bin/init.fugu.countrycode.sh \
    $(LOCAL_PATH)/rootdir/init.fugu.usb.rc:root/init.fugu.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.fugu.rc:root/ueventd.fugu.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.fugu.rc:root/init.recovery.fugu.rc

ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.fugu.diag.rc.userdebug:root/init.fugu.diag.rc
endif

## RenderScript
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

## SEP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sep/sep_policy.conf:system/etc/security/sep_policy.conf

## Stagefright
PRODUCT_PACKAGES += \
    libstagefrighthw

## Thermal
ENABLE_ITUXD := true
PRODUCT_PACKAGES += \
    ituxd

## TV Input
PRODUCT_PACKAGES += \
    android.hardware.tv.input@1.0-impl

## USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

## Video
PRODUCT_PACKAGES += \
    libpvr2d \
    libva \
    libva-android \
    libva-tpi \
    pvr_drv_video \
    vainfo

## Video Firmware
PRODUCT_PACKAGES += \
    msvdx.bin.0008.0000.0000 \
    msvdx.bin.0008.0000.0001 \
    msvdx.bin.0008.0002.0001 \
    msvdx.bin.0008.0000.0002 \
    msvdx.bin.000c.0001.0001 \
    topaz.bin.0008.0000.0000 \
    topaz.bin.0008.0000.0001 \
    topaz.bin.0008.0000.0002 \
    topaz.bin.0008.0002.0001 \
    topaz.bin.000c.0001.0001 \
    vsp.bin.0008.0000.0000 \
    vsp.bin.0008.0000.0001 \
    vsp.bin.0008.0000.0002 \
    vsp.bin.0008.0002.0001 \
    vsp.bin.000c.0001.0001

## Wi-Fi
PRODUCT_PACKAGES += \
    bcmdhd.cal \
    bcmdhd_sr2.cal \
    hostapd \
    lib_driver_cmd_bcmdhd \
    libwpa_client \
    wificond \
    wifilogd \
    wpa_supplicant

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf

## Wi-Fi Firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4354/device-bcm.mk)
