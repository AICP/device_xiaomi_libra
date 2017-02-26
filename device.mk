#
# Copyright (C) 2015 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file includes all definitions that apply to ALL libra devices, and
# are also specific to libra devices
#
# Everything in this directory will become public


PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/xiaomi/libra/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/xiaomi/libra/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    device/xiaomi/libra/configs/media_profiles.xml:system/etc/media_profiles.xml

# Audio
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/xiaomi/libra/audio/audio_output_policy.conf:system/etc/audio_output_policy.conf \
    device/xiaomi/libra/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/xiaomi/libra/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/xiaomi/libra/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    device/xiaomi/libra/audio/surround_sound_rec_AZ.cfg:system/etc/surround_sound_3mic/surround_sound_rec_AZ.cfg \
    device/xiaomi/libra/audio/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt

#Sound Trigger
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/audio/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    device/xiaomi/libra/audio/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml

# Input device files
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/keylayout/atmel-maxtouch.kl:system/usr/keylayout/atmel-maxtouch.kl \
    device/xiaomi/libra/keylayout/atmel-maxtouch-edge.kl:system/usr/keylayout/atmel-maxtouch-edge.kl \
    device/xiaomi/libra/keylayout/ft5x46.kl:system/usr/keylayout/ft5x46.kl \
    device/xiaomi/libra/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/xiaomi/libra/keylayout/qpnp_pon.kl:system/usr/keylayout/qpnp_pon.kl \
    device/xiaomi/libra/keylayout/synaptics_dsx.kl:system/usr/keylayout/synaptics_dsx.kl \
    device/xiaomi/libra/keylayout/synaptics_dsx_edge.kl:system/usr/keylayout/synaptics_dsx_edge.kl

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:system/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml

# For GPS
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/configs/sec_config:system/etc/sec_config

# For WiFi
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/xiaomi/libra/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    device/xiaomi/libra/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/xiaomi/libra/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/qca_cld/WCNSS_cfg.dat \
    device/xiaomi/libra/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/qca_cld/WCNSS_qcom_wlan_nv.bin

PRODUCT_COPY_FILES += \
    device/xiaomi/libra/wifi/hostapd.accept:system/etc/hostapd/hostapd.accept \
    device/xiaomi/libra/wifi/hostapd.conf:system/etc/hostapd/hostapd_default.conf \
    device/xiaomi/libra/wifi/hostapd.deny:system/etc/hostapd/hostapd.deny



# Thermal engine
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/configs/thermal-engine-8992.conf:system/etc/thermal-engine-8992.conf

# MSM IRQ balance
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/configs/msm_irqbalance.conf:system/etc/msm_irqbalance.conf


PRODUCT_TAGS += dalvik.gc.type-precise

# Init
PRODUCT_PACKAGES += \
    init.qcom.power.sh \
    fstab.qcom \
    init.qcom.diag.rc \
    init.qcom.misc.rc \
    init.qcom.ramdump.rc \
    init.qcom.rc \
    init.qcom.sh \
    init.qcom.usb.rc \
    ueventd.qcom.rc

# Display
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# First api level, device has been commercially launched
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=22

# Gello
 PRODUCT_PACKAGES += \
    Gello

# LibraDoze
PRODUCT_PACKAGES += \
    LibraDoze

# ExtraSettings
PRODUCT_PACKAGES += \
    ExtraSettings

# GPS
PRODUCT_PACKAGES += \
    gps.msm8992

PRODUCT_PACKAGES += \
    charger_res_images \
    libhealthd.qcom

PRODUCT_PACKAGES += \
    copybit.msm8992 \
    gralloc.msm8992 \
    hwcomposer.msm8992 \
    memtrack.msm8992 \
    lights.msm8992 \
    liboverlay \
    libtinyxml

PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdashplayer \
    libstagefrighthw \
    libstagefright_soft_flacdec \
    libextmedia_jni \
    libOmxCore \
    libmm-omxcore \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libdivxdrmdecrypt \
    libOmxVidcCommon \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxSwVencMpeg4 \
    libOmxSwVencHevc 

# Audio HAL and utilities
PRODUCT_PACKAGES += \
    audiod \
    audio.primary.msm8992 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio_policy.msm8992 \
    audio_amplifier.msm8992

# some extra tools
PRODUCT_PACKAGES += \
    tinycap \
    tinymix \
    tinypcminfo \
    tinyplay

# Audio effects
PRODUCT_PACKAGES += \
    libaudio-resampler \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors \
    libqcomvisualizer \
    libqcompostprocbundle

PRODUCT_PACKAGES += \
    librmnetctl \
    rmnetcli \
    libtinyxml2 \
    libxml2 \
    libprotobuf-cpp-full

# Connectivity Engine support (CNE)
PRODUCT_PACKAGES += \
    cneapiclient \
    com.quicinc.cne \
    libcnefeatureconfig \
    services-ext

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    make_ext4fs \
    setup_fs

# GPS configuration
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/configs/gps.conf:system/etc/gps.conf

# Fingerprint Sensor
PRODUCT_PACKAGES += \
    fingerprint.libra \
    fingerprintd

# Wi-Fi
PRODUCT_PACKAGES += \
    libwpa_client \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf \
    readmac

# Camera
PRODUCT_PACKAGES += \
    camera.msm8992 \
    libcamera \
    libmmcamera_interface \
    libmmcamera_interface2 \
    libmmjpeg_interface \
    libqomx_core \
    mm-qcamera-app \
    Snap

# Snap Config
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.cpp.duplication=false

# Sensor & activity_recognition HAL
PRODUCT_PACKAGES += \
    sensors.msm8992 \
    activity_recognition.libra

# Multi HAL configuration file
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/configs/hals.conf:system/etc/sensors/hals.conf

# Build stlport for legacy blobs
PRODUCT_PACKAGES += \
    libstlport

# Legacy blob symbols
PRODUCT_PACKAGES += \
    libshim_camera

PRODUCT_PACKAGES += \
    libboringssl-compat

PRODUCT_PACKAGES += \
    keystore.msm8992 \
    gatekeeper.msm8992

# For android_filesystem_config.h
PRODUCT_PACKAGES += \
   fs_config_files

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# ANT+
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml

PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio \
    libbt-vendor

DEVICE_PACKAGE_OVERLAYS := \
    device/xiaomi/libra/overlay

# Power HAL
PRODUCT_PACKAGES += \
    power.msm8992

# Modem debugger/misc
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PACKAGES += \
    QXDMLogger
endif

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, hardware/qcom/msm8994/msm8992.mk)
$(call inherit-product-if-exists, vendor/qcom/gpu/msm8994/msm8994-gpu-vendor.mk)
# Call the proprietary setup
$(call inherit-product-if-exists, vendor/xiaomi/libra/libra-vendor.mk)
