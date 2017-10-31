ifneq (,$(findstring $(TARGET_DEVICE),fugu))

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := librecovery_updater_fugu
LOCAL_SRC_FILES := recovery_updater.cpp fw_version_check.cpp
LOCAL_CFLAGS := -Wall -Werror
# 'ErrorAbort' is deprecated
LOCAL_CFLAGS += -Wno-deprecated-declarations
# 'readbyte_umip_emmc' is unused
LOCAL_CFLAGS += -Wno-unused-function
LOCAL_STATIC_LIBRARIES := libedify

include $(BUILD_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES += bootable/recovery
LOCAL_SRC_FILES := recovery_ui.cpp
LOCAL_CFLAGS := -Wall -Werror

# should match TARGET_RECOVERY_UI_LIB set in BoardConfig.mk
LOCAL_MODULE := librecovery_ui_fugu

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

endif
