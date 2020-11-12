#!/sbin/sh

RADIO=`getprop ro.boot.radio`

mkdir /s
mount /dev/block/bootdevice/by-name/system /s
mkdir /v
mount /dev/block/bootdevice/by-name/oem /v

rm -rf /s/system/priv-app/MotoDoze
if [ "$RADIO" != "APAC" ] && [ "$RADIO" != "EMEA" ] && [ "$RADIO" != "China" ]; then
    # Remove NFC-related files for RADIOs other than APAC, China and EMEA
    rm /v/etc/permissions/com.android.nfc_extras.xml
    rm /v/etc/permissions/android.hardware.nfc.xml
    rm /v/etc/permissions/android.hardware.nfc.hce.xml
    rm /v/etc/permissions/android.hardware.nfc.hcef.xml
    rm -r /s/system/app/NfcNci
fi
if [ "$RADIO" == "Brazil" ] || [ "$RADIO" == "APAC" ] || [ "$RADIO" == "EMEA" ] || [ "$RADIO" == "China" ]; then
    # Remove e-compass file for APAC, Brazil, China and EMEA RADIOs
    rm /v/etc/permissions/android.hardware.sensor.compass.xml
fi
if [ "$RADIO" == "China" ]; then
    mv /v/etc/libnfc-nxp_retcn.conf /v/etc/libnfc-nxp.conf
    mv /v/etc/thermal-engine-retcn.conf /v/etc/thermal-engine.conf
fi

umount /s
rmdir /s
umount /v
rmdir /v
