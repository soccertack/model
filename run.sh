ARMLMD_LICENSE_FILE=8224@127.0.0.1
export ARMLMD_LICENSE_FILE
sudo umount l2_mnt
sudo umount l1_mnt
sudo umount l0_mnt
date
/users/jintackl/linaro-v83/models/Linux64_GCC-4.7/FVP_Base_AEMv8A-AEMv8A \
-a "cluster0.*=linux-system.axf" \
-f fp_config.txt
