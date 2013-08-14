LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# HAL module implemenation stored in
# hw/<COPYPIX_HARDWARE_MODULE_ID>.<ro.product.board>.so
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

LOCAL_C_INCLUDES += hardware/samsung/exynos3/s5pc110/include
LOCAL_C_INCLUDES += hardware/samsung/exynos3/s5pc110/libs3cjpeg
LOCAL_C_INCLUDES += frameworks/native/include/media/hardware

LOCAL_SRC_FILES:= \
	SecCamera.cpp \
	SecCameraHWInterface.cpp \
	SecCameraUtils.cpp \

LOCAL_SHARED_LIBRARIES:= libutils libcutils libbinder liblog libcamera_client libhardware
LOCAL_SHARED_LIBRARIES+= libs3cjpeg

LOCAL_MODULE := camera.wave

LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS += -DFFC_PRESENT

LOCAL_CFLAGS += -DHAVE_FLASH

include $(BUILD_SHARED_LIBRARY)
