#!/bin/bash

declare -i cpu=2
declare -i threads=cpu * 2
declare -i ram=2560 #RAM count
img_hdd0="debian-11-nocloud-amd64-20211220-862.qcow2"

qemu-system-x86_64 -machine q35,accel=hvf \
-smp $threads,cores=$cpu -m $ram -hda $img_hdd0 \
-device e1000,netdev=net0 \
-netdev user,id=net0,hostfwd=tcp::5555-:22 \