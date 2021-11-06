qemu-system-x86_64 -L "C:\Program Files\qemu" -nographic ^
-machine q35 -smp 4,cores=2 -accel whpx -m 5120 ^
-hda debian.qcow2 ^
-device e1000,netdev=net0 ^
-netdev user,id=net0,hostfwd=tcp::5555-:22