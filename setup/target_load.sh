#!/usr/bin/bash

DISK=$1
cd ../

# Write image to drive.
sudo umount $DISK*
sudo mkfs.ext4 $DISK
cd ../buildroot/
sudo dd if=output/images/sdcard.img of=$DISK status="progress"
cd ../