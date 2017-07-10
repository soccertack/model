#!/bin/bash

./mount_l0.sh
./mount_l1.sh
sudo cp run-guest.sh l0_mnt/srv/vm/run-guest.sh
sudo cp run-guest.sh l1_mnt/root/vm/run-guest.sh
sudo umount l1_mnt
sudo umount l0_mnt
