# licheepi-tree

External tree used to configure [Buildroot](https://buildroot.org) for Lichee Pi Zero.

Main goals of this project:

- use audio, recording and play are enabled
- use Wi-Fi via ESP8089, driver is installed as kernel module and loaded on startup
- use console via Serial Gadget (by power cable)

## Structure

1. **board** - Linux configuration, rootfs overlay, out-of-tree dts files and setup scripts.
2. **configs** - Buildroot config

## Installation

1. Clone project next to [Buildroot](https://github.com/buildroot/buildroot)

   ```bash
   git clone https://github.com/korr237i/licheepi-tree.git
   ```

2. Initialize tree as external (fish shell, in `buildroot/`)

   ```bash
   make BR2_EXTERNAL=(pwd)/../licheepi-tree/ ../licheepi-tree/configs/licheepi.config
   ```
   
   You can check output/.br2-external.mk to see if external tree was initialized correctly.

3. Run `make menuconfig`  to initialize Buildroot and merge config from external tree:

   ```bash
   support/kconfig/merge_config.sh .config ../licheepi-tree/configs/licheepi.config
   ```

4. Run `make linux-menuconfig` and save Linux configuration obtained from external tree.

5. Add esp8089 driver to kernel: in `board/setup/`, run `./kernel-add-esp8089.sh`, and enable esp8089 package in `Networking support / Wireless` as kernel module.

6. Run `make`

7. Write image on disk (e.g. /dev/sdc/), in `licheepi-tree/board/`, run:
    ```bash
    ./target_load.sh "/dev/sdc"
    ```
    
    To update filesystem on remote working machine, in `licheepi-tree/board/`, run:
    
    ```bash
    ./target_load_remote.sh port_number hostname password
    ```

## Additional configuration

Virtual devices using socat

```
socat -d -d pty,link=/dev/ttyL0,raw,echo=0,mode=666 pty,link=/dev/ttyL1,raw,echo=0,mode=666
```

