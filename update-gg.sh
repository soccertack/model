#!/bin/bash

./mount_l0.sh
./mount_l1.sh

cp /users/jintackl/guest-low/arch/arm64/boot/Image l0_mnt/srv/vm
cp /users/jintackl/guest-low/arch/arm64/boot/Image l1_mnt/root/vm

umount l1_mnt
umount l0_mnt
