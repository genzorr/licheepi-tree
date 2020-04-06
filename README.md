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

1. Clone project next to [Buildroot](https://github.com/buildroot/buildroot)

   ```bash
   git clone https://github.com/korr237i/licheepi-tree.git
   ```

2. Initialize tree as external (fish shell, in buildroot directory)

   ```bash
   make BR2_EXTERNAL=(pwd)/../licheepi-tree/ ../licheepi-tree/configs/licheepi.config
   ```
   
   You can check output/.br2-external.mk to see if external tree was initialized correctly.

3. Run `make menuconfig`  to initialize buildroot and merge config from external tree:

   ```bash
   support/kconfig/merge_config.sh .config ../licheepi-tree/configs/licheepi.config
   ```

4. Run `make linux-menuconfig` and save linux configuration obtained from external tree.

5. Add esp8089 driver to kernel: in setup, run `./kernel-add-esp8089.sh`, and enable esp8089 package in `Networking support / Wireless` as kernel module.

6. Run `make`

7. Write image on disk (e.g. /dev/sdc/)
    ```bash
    cd ../licheepi-tree/setup/
    ./target_load.sh "/dev/sdc"
    ```