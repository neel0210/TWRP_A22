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

PRODUCT_DEVICE := a22x
PRODUCT_NAME := twrp_a22x
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A226B
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="a22xnsxx-user 12 SP1A.210812.016 A226BXXS9DXD2 release-keys"

BUILD_FINGERPRINT := samsung/a22xnsxx/a22x:12/SP1A.210812.016/A226BXXS9DXD2:user/release-keys
