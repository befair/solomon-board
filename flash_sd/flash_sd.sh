#!/bin/bash

#The program must run as root
if [ "`id -u`" -ne 0 ]; then

	echo "You must run the script as super user"
	sleep 5
	exit 100
fi

#Check if all arguments are set
if [ -z "$3" ]; then #-z string is null

	echo "ERROR: Variable not set!"
	echo "Usage: $0  <path to iso> <device to write> <hostname> [provider]" #network .. todo
	sleep 10
	exit 100
fi

#Input var
ISO_PATH="$1"
DEV_NAME="$2"
NEW_HOSTNAME="$3"
#NETWORK_TYPE="$4" #.. to do
PROVIDER="$4"

#Work var
FULL_DEV_NAME="/dev/$DEV_NAME"
UMOUNT_ALL="${FULL_DEV_NAME}*"
#Progress var
PROG_10='#####                                             (10%)\r'
PROG_50='#########################                         (50%)\r'
PROG_75='########################################          (75%)\r'
PROG_100='##################################################(100%)\r'

#####Before starting please do not delete my files.
if [ $DEV_NAME = "/dev/sda" ]; then

	exit 100
else

        echo "Thank you!"
fi

#START
echo $PROG_10

#Umount the SD if it is automaticly mounted by the system
umount $UMOUNT_ALL

#Write ISO
echo "Write ISO"
#dd if="$ISO_PATH" of=$FULL_DEV_NAME status=progress
echo $PROG_50

#Mount ISO
echo "Mount ISO"
mkdir /mnt/$NEW_HOSTNAME
kpartx -a -v $FULL_DEV_NAME
sleep 5
mount "/dev/mapper/${DEV_NAME}2" /mnt/$NEW_HOSTNAME

#Change host
echo "Change hostname"
echo $NEW_HOSTNAME > /mnt/$NEW_HOSTNAME/etc/hostname
sed -i "/127.0.1.1/c\127.0.1.1\t$NEW_HOSTNAME" /mnt/$NEW_HOSTNAME/etc/hosts

#Change minion id
echo "Change minion id"
echo $NEW_HOSTNAME > /mnt/$NEW_HOSTNAME/etc/salt/minion_id
echo $PROG_75

#Set connection type
if [ -n "$PROVIDER" ]; then #-n string is not null

	echo "Set connection"
	sh $PWD/network_umts.sh $PROVIDER "/mnt/$NEW_HOSTNAME"
fi

#Create the udev rules
cp /mnt/$NEW_HOSTNAME/etc/solomon/99-usb-serial.rules /mnt/$NEW_HOSTNAME/etc/udev/rules.d/99-usb-serial.rules

#Umount ISO
echo "Umount iso"
umount /mnt/$NEW_HOSTNAME
rm -r /mnt/$NEW_HOSTNAME
kpartx -d -v $FULL_DEV_NAME

#END
echo $PROG_100
