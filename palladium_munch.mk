#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common palladium stuff.
$(call inherit-product, vendor/palladium/config/common_full_phone.mk)

# Inherit from munch device
$(call inherit-product, device/xiaomi/munch/device.mk)

PRODUCT_NAME := palladium_munch
PRODUCT_DEVICE := munch
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi K40S
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="munch-user 12 RKQ1.211001.001 V13.0.4.0.SLMINXM release-keys"

BUILD_FINGERPRINT := Redmi/munch/munch:12/RKQ1.211001.001/V13.0.4.0.SLMINXM:user/release-keys
