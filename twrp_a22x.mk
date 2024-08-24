#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_RELEASE_NAME := a22x

# Inherit from those products. Most specific first.
# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit from a22x device
$(call inherit-product, device/samsung/a22x/device.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(DEVICE_PATH)/recovery/root,recovery/root)

PRODUCT_PACKAGES += \
    charger_res_images

# Define Product
PRODUCT_DEVICE := a22x
PRODUCT_NAME := twrp_a22x
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A226B
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung
