#!/bin/sh

#Variables
FILE_IN=/var/lib/wifi_config.txt
FILE_OUT=/etc/wpa_supplicant/wpa_supplicant.conf

FILE_IN_INVT_CHECK=/var/lib/wifi_config_invt.txt
FILE_IN_INVT_SMA=/var/www/html/123solar/config/config_sma/config_invt1.php
FILE_IN_INVT_AURORA=/var/www/html/123solar/config/config_aurora/config_invt1.php
FILE_OUT_INVT=/var/www/html/123solar/config/config_invt1.php

#Check if file exists
if [ -f $FILE_IN ]; then
	#Write data to new file
	cp $FILE_IN $FILE_OUT
fi

#Check if file exists
if [ -f $FILE_IN_INVT_CHECK ]; then
	if grep -Fxq "aurora" $FILE_IN_INVT_CHECK; then
		cp $FILE_IN_INVT_AURORA $FILE_OUT_INVT
	fi
	if grep -Fxq "sma" $FILE_IN_INVT_CHECK; then
		cp $FILE_IN_INVT_SMA $FILE_OUT_INVT
        fi
fi
