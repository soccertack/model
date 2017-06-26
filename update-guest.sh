#!/bin/bash
IMAGE=${1:-Image}

source update-common.sh

#DIR="psci-guest-4.12"

#This is 4.10 with 100Hz
DIR="pv-guest-model"

#This is 4.12
#DIR="vanilla"

SRC_PATH=$MODEL/$DIR/arch/arm64/boot

L0_PATH=.

echo $SRC_PATH
#scp jintack@jintack.cs.columbia.edu:$SRC_PATH/$IMAGE  .
sudo mount $L0_PATH/L0.img l0_mnt
md5sum $IMAGE
sudo cp $IMAGE l0_mnt/srv/vm/Image
md5sum l0_mnt/srv/vm/Image
sudo umount l0_mnt
