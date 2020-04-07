#!/usr/bin/bash


cp Kconfig ../../../buildroot/output/build/linux-zero-4.13.y/net/
cp Makefile ../../../buildroot/output/build/linux-zero-4.13.y/net/

cd ../../../buildroot/output/build/linux-zero-4.13.y/net/
rm -rf esp8089
git clone https://github.com/Icenowy/esp8089
# git clone https://github.com/al177/esp8089.git
