#
# Copyright (C) 2018-2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a70q

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_TARGETS += *
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(DEVICE_PATH)/overlay-lineage/lineage-sdk \
    $(DEVICE_PATH)/overlay-lineage/packages/apps/Snap

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/etc/audio_policy_configuration.xml

# Camera
PRODUCT_PACKAGES += \
    Snap

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze

# Fingerprint feature
TARGET_HAS_FOD := true
EXTRA_FOD_ANIMATIONS := true

PRODUCT_PACKAGES += \
    lineage.biometrics.fingerprint.inscreen@1.0-service.a70q

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    vendor/lineage/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:system/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    Tag \
    libnfc-nci \
    libnfc-nci_jni

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/nfc/libnfc-nci.conf:system/etc/libnfc-nci.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:system/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \
    android.hardware.power@1.0-service \
    power.qcom:64

# Ramdisk
PRODUCT_PACKAGES += \
    init.qcom.rc

# Sensor
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl.a70q

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:system/etc/permissions/android.hardware.sensor.hifi_sensors.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Touchscreen
PRODUCT_PACKAGES += \
    libtinyxml2

# Trust HAL
PRODUCT_PACKAGES += \
    lineage.trust@1.0-service

# VNDK-SP
PRODUCT_PACKAGES += \
    vndk_package

# Wifi
PRODUCT_PACKAGES += \
    hostapd \
    libwifi-hal-ctrl \
    libwifi-hal-qcom \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_TARGET_VNDK_VERSION := 29
