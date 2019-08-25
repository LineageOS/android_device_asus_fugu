## Audio
PRODUCT_PROPERTY_OVERRIDES +=  \
    media.aac_51_output_enabled=true

## Codecs
PRODUCT_PROPERTY_OVERRIDES +=  \
    media.stagefright.cache-params=10240/20480/15 \

## DPI
# xhdpi, while we are hardcoding the 1080 resolution.
# when we start doing 720 as well, will need to stop hardcoding this.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320


## Dalvik
# Called first so we set all properties
$(call inherit-product-if-exists, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
# Override specific properties based on stock values
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapsize=174m \
    dalvik.vm.implicit_checks=none \
    ro.dalvik.vm.isa.arm=x86

## DRM
PRODUCT_PROPERTY_OVERRIDES +=  \
    drm.service.enabled=true \
    ro.com.widevine.cachesize=16777216

## HDMI
# CEC: Disable 'Set Menu Language' feature.
PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.set_menu_language=false
# CEC: Fugu works as a playback device (4).
PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.device_type=4

## Houdini
# Set the prop to enable arm native bridge
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.dalvik.vm.native.bridge=libhoudini.so \
    ro.enable.native.bridge.exec=1

## HWUI
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
   ro.hwui.drop_shadow_cache_size=4.0 \
    ro.hwui.gradient_cache_size=0.8 \
    ro.hwui.layer_cache_size=32.0 \
    ro.hwui.path_cache_size=24.0 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.texture_cache_size=48.0 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=512

## Intel
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.intel.isv.frc=1 \
    persist.intel.isv.vpp=1

## NRDP
# For Netflix compatibility in the Play Store
PRODUCT_PROPERTY_OVERRIDES +=  \
    ro.nrdp.modelgroup=NEXUSPLAYERFUGU

## OMX
# Set service to non-Treble
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false

## OpenGL
# For additional app compatibility in the Play Store
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196609

## Shipping API Level
# Some CTS tests will be skipped based on what the initial API level that
# shipped on device was.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=21

## Stagefright
# Keep secure decoders in mediaserver process
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.less-secure=true

## Vendor security patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2017-11-05

## Vold
PRODUCT_PROPERTY_OVERRIDES +=  \
    ro.vold.wipe_on_crypt_fail=1
