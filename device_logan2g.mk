$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product, vendor/samsung/logan2g/logan2g-vendor.mk)

$(call inherit-product, vendor/samsung/logan2g/logan2g-vendor-blobs.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/logan2g/overlay

LOCAL_PATH := device/samsung/logan2g
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_logan2g
PRODUCT_DEVICE := logan2g

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.sc6820i.rc:root/init.sc6820i.rc \
    $(LOCAL_PATH)/rootdir/init.sc6820i.usb.rc:root/init.sc6820i.usb.rc \
    $(LOCAL_PATH)/rootdir/fstab.sc6820i:root/fstab.sc6820i \
    $(LOCAL_PATH)/rootdir/init.trace.rc:root/init.trace.rc \
    $(LOCAL_PATH)/rootdir/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/rootdir/init.bt.rc:root/init.bt.rc \
    $(LOCAL_PATH)/rootdir/init.goldfish.rc:root/init.goldfish.rc \
    $(LOCAL_PATH)/rootdir/lpm.rc:root/lpm.rc \
    $(LOCAL_PATH)/rootdir/init.rc:root/init.rc \
    $(LOCAL_PATH)/rootdir/ueventd.sc6820i.rc:root/ueventd.sc6820i.rc \
    $(LOCAL_PATH)/rootdir/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/rootdir/bin/charge:root/bin/charge \
    $(LOCAL_PATH)/rootdir/bin/poweroff_alarm:root/bin/poweroff_alarm \
    $(LOCAL_PATH)/rootdir/bin/rawdatad:root/bin/rawdatad \
    $(LOCAL_PATH)/rootdir/ueventd.goldfish.rc:root/ueventd.goldfish.rc \
    $(LOCAL_PATH)/rootdir/sbin/adbd:root/sbin/adbd \
    $(LOCAL_PATH)/rootdir/sbin/ffu:root/sbin/ffu \
#$(LOCAL_PATH)/rootdir/sbin/ueventd:root/sbin/ueventd \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab \

# Idc
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/idc/Zinitix_tsp.idc:system/usr/idc/Zinitix_tsp.idc

# Keylayout
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/keylayout/sci-keypad.kl:system/usr/keylayout/sci-keypad.kl

# Media
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
     $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=150 \
    ro.telephony.ril_class=SamsungBCMRIL

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    tinymix

PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
     $(LOCAL_PATH)/audio/devicevolume.xml:system/etc/devicevolume.xml \
     $(LOCAL_PATH)/audio/formatvolume.xml:system/etc/formatvolume.xml \
     $(LOCAL_PATH)/audio/tinyucm.conf:system/etc/tinyucm.conf
#$(LOCAL_PATH)/audio/default_gain.conf:system/etc/default_gain.conf

# Hw params
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/hw_params/audio_para:system/etc/audio_para \
     $(LOCAL_PATH)/hw_params/codec_pga.xml:system/etc/codec_pga.xml\
     $(LOCAL_PATH)/hw_params/tiny_hw.xml:system/etc/tiny_hw.xml

# Device props
PRODUCT_PROPERTY_OVERRIDES := \
	keyguard.no_require_sim=true \
	ro.com.android.dataroaming=false \
	persist.msms.phone_count=1 \
	persist.sys.sprd.modemreset=1

# Sensors
#PRODUCT_PACKAGES += \
#    lights.sc6820i

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Filesystem management tools
PRODUCT_PACKAGES += \
    setup_fs

# Misc packages
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

## LDPI assets
PRODUCT_AAPT_CONFIG := normal ldpi mdpi nodpi
PRODUCT_AAPT_PREF_CONFIG := ldpi
#$(call inherit-product, device/ldpi-common/ldpi.mk)
