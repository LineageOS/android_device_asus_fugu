# Common board config for fugu

# Kernel
TARGET_KERNEL_CROSS_COMPILE_PREFIX := x86_64-linux-android-
TARGET_KERNEL_CONFIG := lineage_fugu_defconfig
TARGET_KERNEL_SOURCE := kernel/asus/fugu
TARGET_KERNEL_ARCH := x86_64
BOARD_KERNEL_IMAGE_NAME := bzImage

# Vendor blobs
-include vendor/google/marlin/BoardConfigVendor.mk
