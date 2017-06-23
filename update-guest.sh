#!/bin/bash
IMAGE=${1:-Image}
#SRC_PATH=/home/jintack/model/pv-guest-model/arch/arm64/boot
#SRC_PATH=/home/jintack/model/nopv-guest-model/arch/arm64/boot

#This is all-pv
#SRC_PATH=/home/jintack/nesting/pv-guest/arch/arm64/boot

#This is psci only pv
SRC_PATH=/home/jintack/model/psci-guest-4.12/arch/arm64/boot

# This is vanilla
#SRC_PATH=/home/jintack/model/vanilla/arch/arm64/boot

#SRC_PATH=/home/jintack/nesting/pv-guest-4.12/arch/arm64/boot
#L0_PATH=/proj/kvmarm-PG0/jintack/
L0_PATH=.

echo $SRC_PATH
scp jintack@jintack.cs.columbia.edu:$SRC_PATH/$IMAGE  .
sudo mount $L0_PATH/L0.img l0_mnt
md5sum $IMAGE
sudo cp $IMAGE l0_mnt/srv/vm/Image
md5sum l0_mnt/srv/vm/Image
sudo umount l0_mnt
