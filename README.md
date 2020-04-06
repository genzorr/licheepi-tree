# licheepi-tree

External tree used to configure [Buildroot](https://buildroot.org) for Lichee Pi Zero (2nd gen).

Main goals of this project:

- use audio, recording and play are enabled
- use Wi-Fi via ESP8089, driver is installed into kernel and loaded on startup
- use console via Serial Gadget (by power cable)

## Structure

1. **board** - Linux config for Buildroot
2. **configs** - Buildroot config
4. **rootfs_overlay** - needed files to be replaced in target filesystem
5. **setup** - scripts and files used to setup installation and prepare image

## Installation

1. Clone project to the same directory as [Buildroot](https://github.com/buildroot/buildroot)

   ```bash
   git clone https://github.com/korr237i/licheepi-tree.git
   ```

   

2. Initialize tree as external (fish shell)

   ```bash
   cd buildroot/
   cp ../licheepi-tree/configs/licheepi.config .config
   make BR2_EXTERNAL=(pwd)/../licheepi-tree/ ../licheepi-tree/configs/licheepi.config
   ```

   You can check output/.br2-external.mk to see if external tree was initialized.

3. Prepare to build

   ```bash
   make source
   cd ../licheepi-tree/setup/
   ./kernel-add-esp8089.sh
   cd ../
   ```

   Check packages in linux-menuconfig and make:

   ```bash
   cd ../buildroot
   make linux-menuconfig
   make
   ```
   

Choose disk where to write image (e.g. /dev/sdc/)

   ```bash
   cd ../licheepi-tree/setup/
   ./target_load.sh "/dev/sdc"
   ```