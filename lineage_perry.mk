#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/motorola/perry/device.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_perry
PRODUCT_DEVICE := perry
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto E (4)
PRODUCT_MANUFACTURER := motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="perry_retail-user 7.1.0 NPQS26.69-64-17 20 release-keys" \
    PRODUCT_NAME="perry_retail"

BUILD_FINGERPRINT := motorola/perry_retail/perry:7.1.0/NPQS26.69-64-17/20:user/release-keys

PRODUCT_GMS_CLIENTID_BASE := android-motorola
