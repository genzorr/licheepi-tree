#!/usr/bin/bash

DISK=$1
cd ../

# Write image to drive.
sudo umount $DISK*
sudo mkfs.ext4 $DISK
cd ../buildroot/
sudo dd if=output/images/sdcard.img of=$DISK status="progress"
cd ../licheepi-tree/

# Move firmware for Wi-Fi chip.
sudo mount /dev/sdc2 /mnt
cd esp8089/firmware/
echo "Adding esp8089 firmware"
sudo cp *.bin /mnt/lib/firmware
sudo umount /mnt /dev/sdc2
cd ../../
