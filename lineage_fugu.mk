# Boot animation
TARGET_SCREEN_HEIGHT := 1080
TARGET_SCREEN_WIDTH := 1920

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_tv.mk)

# Inherit device configuration
$(call inherit-product, device/asus/fugu/aosp_fugu.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_fugu
PRODUCT_BRAND := google
PRODUCT_DEVICE := fugu
PRODUCT_MODEL := Nexus Player
PRODUCT_MANUFACTURER := Asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=fugu \
    PRIVATE_BUILD_DESC="fugu-user 8.0.0 OPR2.170623.027 4397545 release-keys"

BUILD_FINGERPRINT := google/fugu/fugu:8.0.0/OPR2.170623.027/4397545:user/release-keys
