#!/usr/bin/bash
cd ../../buildroot
make savedefconfig

cd ../licheepi-tree/
cp ../buildroot/output/build/linux-*/.config board/linux.config
