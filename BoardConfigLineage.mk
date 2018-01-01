# Lineage board config for fugu

# Kernel
TARGET_KERNEL_CROSS_COMPILE_PREFIX := x86_64-linux-android-
TARGET_KERNEL_CONFIG := lineage_fugu_defconfig
TARGET_KERNEL_SOURCE := kernel/asus/fugu
TARGET_KERNEL_ARCH := x86_64
BOARD_KERNEL_IMAGE_NAME := bzImage

#TWRP (optional)
ifeq ($(WITH_TWRP),true)
-include device/asus/fugu/twrp.mk
endif

# Vendor blobs
-include vendor/asus/fugu/BoardConfigVendor.mk
