# Boot animation
TARGET_SCREEN_HEIGHT := 1080
TARGET_SCREEN_WIDTH := 1920

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/cm/config/common_full_tv.mk)

# Inherit device configuration
$(call inherit-product, device/asus/fugu/aosp_fugu.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_fugu
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus Player
PRODUCT_MANUFACTURER := Asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=fugu \
    BUILD_FINGERPRINT=google/fugu/fugu:7.1.1/NMF27D/3783773:user/release-keys \
    PRIVATE_BUILD_DESC="fugu-user 7.1.1 NMF27D 3783773 release-keys"

$(call inherit-product-if-exists, vendor/google/marlin/marlin-vendor.mk)
