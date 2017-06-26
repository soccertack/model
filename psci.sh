#!/bin/bash

./mount_l0.sh
pushd l0_mnt/srv/vm
ln -fs qemu/aarch64-softmmu/qemu-system-aarch64-$1 qemu-system-aarch64
ls -al
popd
umount l0_mnt/

