qemu-system-x86_64 -L "C:\Program Files\qemu" -sdl ^
-smp 4,cores=2 -machine q35,accel=whpx -m 5120 ^
-hda debian.qcow2 -cdrom debian-11.1.0-amd64-netinst.iso