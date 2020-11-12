#!/sbin/sh

RADIO=`getprop ro.boot.radio`

rm -rf /system_root/system/priv-app/MotoDoze
if [ "$RADIO" != "APAC" ] && [ "$RADIO" != "EMEA" ] && [ "$RADIO" != "China" ]; then
    # Remove NFC-related files for RADIOs other than APAC, China and EMEA
    rm /vendor/etc/permissions/com.android.nfc_extras.xml
    rm /vendor/etc/permissions/android.hardware.nfc.xml
    rm /vendor/etc/permissions/android.hardware.nfc.hce.xml
    rm /vendor/etc/permissions/android.hardware.nfc.hcef.xml
    rm -r /system_root/system/app/NfcNci
fi
if [ "$RADIO" == "Brazil" ] || [ "$RADIO" == "APAC" ] || [ "$RADIO" == "EMEA" ] || [ "$RADIO" == "China" ]; then
    # Remove e-compass file for APAC, Brazil, China and EMEA RADIOs
    rm /vendor/etc/permissions/android.hardware.sensor.compass.xml
fi
if [ "$RADIO" == "China" ]; then
    mv /vendor/etc/libnfc-nxp_retcn.conf /vendor/etc/libnfc-nxp.conf
    mv /vendor/etc/thermal-engine-retcn.conf /vendor/etc/thermal-engine.conf
fi
