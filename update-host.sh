#!/bin/bash

source update-common.sh

# This is the working version
#scp $SRV:$MODEL/host-rfc-v2/$KERNEL .

# This is 4.10 version
scp $SRV:$NESTING/host-model-4.10/$KERNEL .
