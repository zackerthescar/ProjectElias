# Project Elias

Project Elias is a set of scripts to very quickly and easily create a Linux environment on practically anything that can support QEMU.

This can be useful in a number of scenarios where you need a bare-bones Linux system in a quick and efficient way. 

This set of scripts came about when I was reading [Professor Kauffman's Unix/Linux guide](https://www-users.cse.umn.edu/~kauffman/tutorials/unix-environment.html#org5d0811f) for the CSCI 2021 course here at the University of Minnesota, and realizing my Mac wouldn't be up to the task without something like this because Apple decided GDB wasn't something Mac users needed anymore. 

Why the name Elias- I couldn't decide on a name, so I came up with **L**inux **I**n **A** **S**cript, and then from there the name Elias came out
# Files
All files in .bat format are for Windows, and .sh for any other OS, although it will be mainly targeted at macOS.

 - boot.bat: Starts up the VM with an SDL window
 - boot-nogui.bat: Starts up the VM with nothing but a serial console
 - boot-install.bat: Starts up the VM with an SDL window and a mounted Linux install disk file

Right now, the scripts expect a Debian.qcow2 image in the same folder as the script, and the boot-install script expects a Debian 11 netinst .iso in the same folder as the script. I plan to change that soon.

