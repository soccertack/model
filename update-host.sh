#!/bin/bash

source update-common.sh

# This is the working version
scp $SRV:$MODEL/host-rfc-v2/$IMG .

#scp $SRV:$NESTING/host-model-4.10/$IMG .
#scp $SRV:$NESTING/host-measure/$IMG .
