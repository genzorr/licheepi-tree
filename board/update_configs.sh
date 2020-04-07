#!/usr/bin/bash
cd ../
# cp ../buildroot/.config configs/licheepi.config
cd ../buildroot
make savedefconfig
cd ../licheepi-tree/

cp ../buildroot/output/build/linux-zero-4.13.y/.config board/linux.config