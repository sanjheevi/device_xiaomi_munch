# Adb
ifeq ($(TARGET_BUILD_VARIANT),eng)
# /vendor/default.prop is force-setting ro.adb.secure=1
# Get rid of that by overriding it in /product on eng builds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0
endif

# Priv-app permission
PRODUCT_PRODUCT_PROPERTIES += \
	ro.control_privapp_permissions=log 

# RIL
PRODUCT_PRODUCT_PROPERTIES += \
    ro.telephony.default_network=33,33 \
    ril.subscription.types=NV,RUIM