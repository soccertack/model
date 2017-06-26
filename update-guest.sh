#!/bin/bash
IMAGE=${1:-Image}

source update-common.sh

#DIR="psci-guest-4.12"

#This is 4.10 with 100Hz
#DIR="pv-guest-model"

LOCAL="/users/jintackl"
DIR="guest-pv"
BOOT="arch/arm64/boot"

#This is 4.12
#DIR="vanilla"

#SRC_PATH=$MODEL/$DIR/arch/arm64/boot
SRC_PATH=$LOCAL/$DIR/$BOOT

L0_PATH=.

echo $SRC_PATH
#scp jintack@jintack.cs.columbia.edu:$SRC_PATH/$IMAGE  .
cp $SRC_PATH/Image .

sudo mount $L0_PATH/L0.img l0_mnt
md5sum $IMAGE
sudo cp $IMAGE l0_mnt/srv/vm/Image
sudo md5sum l0_mnt/srv/vm/Image
sudo umount l0_mnt
