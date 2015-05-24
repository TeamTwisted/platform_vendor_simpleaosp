# Brand
PRODUCT_BRAND ?= twisted

# Local path for prebuilts
LOCAL_PATH:= vendor/twisted/prebuilts/common/system

# Common build prop overrides 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.dataroaming=false \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    keyguard.no_require_sim=true \
    drm.service.enabled=true \
    ro.facelock.black_timeout=400 \
    ro.facelock.det_timeout=1500 \
    ro.facelock.rec_timeout=2500 \
    ro.facelock.lively_timeout=2500 \
    ro.facelock.est_max_time=600 \
    ro.facelock.use_intro_anim=false \
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.build.selinux=1 \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    dalvik.vm.image-dex2oat-filter=everything \
    dalvik.vm.dex2oat-filter=everything

# Common overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/twisted/overlays/common

# Nova Launcher
PRODUCT_COPY_FILES += \
    vendor/twisted/prebuilt/common/app/Nova.apk:system/app/Nova/Nova.apk \
    vendor/twisted/prebuilt/common/lib/libgif.so:system/app/Nova/lib/arm/libgif.so

# Titanium Backup
PRODUCT_COPY_FILES += \
    vendor/twisted/prebuilt/common/app/TitaniumBackup.apk:system/app/TitaniumBackup/TitaniumBackup.apk \
    vendor/twisted/prebuilt/common/lib/libtitanium.so:system/app/TitaniumBackup/lib/arm/libtitanium.so

#SuperSu
PRODUCT_COPY_FILES += \
    vendor/twisted/prebuilt/common/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/twisted/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# Needed Packages
PRODUCT_PACKAGES += \
LockClock \
Layers \
Layersbackup \
SimpleExplorer \
AdAway \
KernelAdiutor

# Proprietary latinime lib needed for swyping
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# Enable sip+voip on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Blobs for media effects
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vendor/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    $(LOCAL_PATH)/vendor/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd

# Backuptool support
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/addon.d/50-simpleaosp.sh:system/addon.d/50-simpleaosp.sh \
    $(LOCAL_PATH)/bin/backuptool.functions:system/bin/backuptool.functions \
    $(LOCAL_PATH)/bin/backuptool.sh:system/bin/backuptool.sh

# Bootanimation support
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/bootanimation.zip:system/media/bootanimation.zip

# Squisher Location
SQUISHER_SCRIPT := vendor/twisted/tools/squisher


# Inherite sabermod vendor
SM_VENDOR := vendor/sm
include $(SM_VENDOR)/Main.mk


# Include chromium prebuilt if opted in
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
include prebuilts/chromium/$(TARGET_DEVICE)/chromium_prebuilt.mk
endif
