#!/bin/bash

sudo ./mount_l0.sh
sudo ./mount_l1.sh

sudo cp /users/jintackl/guest-low/arch/arm64/boot/Image l1_mnt/root/vm

sudo umount l1_mnt
sudo umount l0_mnt
