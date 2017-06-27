#!/bin/bash
IMAGE=${1:-Image}

source update-common.sh

#DIR="psci-guest-4.12"

#This is 4.10 with 100Hz
#DIR="pv-guest-model"

LOCAL="/users/jintackl"
DIR="guest-vanilla"
BOOT="arch/arm64/boot"

# For remote, uncomment this. Untested
#SRC_PATH=$MODEL/$DIR/arch/arm64/boot
#CP=scp

CP=cp
SRC_PATH=$LOCAL/$DIR/$BOOT

L0_PATH=.

echo $SRC_PATH
$CP $SRC_PATH/Image .

sudo mount $L0_PATH/L0.img l0_mnt
md5sum $IMAGE
sudo cp $IMAGE l0_mnt/srv/vm/Image
sudo md5sum l0_mnt/srv/vm/Image
sudo umount l0_mnt
