# Quickly creating a Debian VM
0. Make sure you have QEMU and QEMU-IMG in your path. Get QEMU from brew (on macOS) or just [download QEMU](https://www.qemu.org/download/) and make sure to include the QEMU folder in your path (on Windows)

1. Download the Debian _nocloud_ cloud image from [the Debian website](https://cloud.debian.org/images/cloud/). The format of the image should be something like `debian-XX-nocloud-ARCH-YYYYMMDD-ZZ.qcow2`. Put this in the same folder as where you downloaded the scripts
2. Increase the virtual size of the disk. This can be done with 	`qemu-img`:
```qemu-img resize [image name].qcow2 +[INCREASE_SIZE]G```
3. Edit the `boot.bat/boot.sh` and `boot-nogui.bat/boot-nogui.sh` with your desired parameters
| Variable | Description |
|--|--|
| cpu | Cores to allocate to the VM  |
| threads | Threads to allocate to the VM |
| ram | RAM to allocate to the VM |
| img_hdd0 | Virtual disk file |

	If your CPU has hyperthreading, you should use `cpu * 2` for the thread count. Otherwise, thread count should be equal to CPU core count.
I recommend allocating roughly 3/8th of your RAM for the VM.
Just set the `img_hdd0` variable to the Debian image you just downloaded and resized.

4. Start the Debian VM. Either `boot-nogui` or `boot` will work. I've only tested `boot-nogui` so far, but there's no reason why `boot` wouldn't work either. After a few seconds you should get a login prompt. `root` for the username and a blank password will work. Needless to say that's pretty dangerous.
5. Set a new root password: `passwd`
6. Generate SSH hostkeys: `ssh-keygen -A`
7. Create a new user: `adduser [username]` and follow prompt
8. Add user to the sudo group: `usermod -a -G sudo [username]`
9. Fire up a CLI editor of choice and add this line below to the top of the file `/etc/hosts`
```127.0.0.1	debian``` 
(that's a tab, btw)
10. `exit`, then log into your new user
11. Test sudo, then add your SSH public key (the .pub file). This is done by creating the folder `.ssh` in your new user's home folder and creating a new text file `authorized_keys` Remember to set perms using `chmod 600 ~/.ssh/authorized_keys` and `chmod 700 ~/.ssh`
12. Try SSH-ing into your machine with `ssh -p 5555 [username]@localhost`, install the packages you need, run wild!

These steps should be enough for you to have a Debian VM that you can SSH into to do whatever Linux-y/Unix-y stuff you need to do.
