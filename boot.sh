#!/bin/bash

vm_mem=2560
img_hdd0="Debian.qcow2"

qemu-system-x86_64 -machine q35,accel=hvf \
-smp 4,cores=2 -m $vm_mem -hda $img_hdd0 \
-device e1000,netdev=net0 \
-netdev user,id=net0,hostfwd=tcp::5555-:22