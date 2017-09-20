#!/bin/bash
#Set the selected provider as Default for wvdial

PROVIDER="$1"
PARTITION="$2"
FILE_PROVIDER="$PARTITION/etc/solomon/wvdial/wvdial_${PROVIDER}"

mv $FILE_PROVIDER > $PARTITION/etc/wvdial.conf

