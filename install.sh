#!/bin/bash

username=neo
hostname=matrix
pass=1811
disk_root=/dev/sda3
disk_boot=/dev/sda2
ucode=intel-ucode

#formating disk
mkfs.btrfs -f $disk_root
#formating disk
mkfs.vfat $disk_boot
#mount mnt
mount $disk_root /mnt
#cd /mnt
cd /mnt
#su cr
btrfs su cr @
#su cr
btrfs su cr @home
#su cr
btrfs su cr @var
#cd
cd
#umount
umount /mnt
#mount disk
mount -o noatime,compress=zstd:3,space_cache=v2,discard=async,subvol=@ $disk_root /mnt
#mkdir folders
mkdir /mnt/{var,home,boot}
#mkdir /boot/efi
mkdir /mnt/boot/efi
#mount disk
mount -o noatime,compress=zstd:3,space_cache=v2,discard=async,subvol=@home $disk_root /mnt/home
#mount disk
mount -o noatime,compress=zstd:3,space_cache=v2,discard=async,subvol=@var $disk_root /mnt/var
#install arch
pacstrap -K /mnt base base-devel linux-firmware refind efibootmgr iwd networkmanager micro htop btrfs-progs git $ucode zsh --noconfirm
#fstab generation
genfstab -U -p /mnt >> /mnt/etc/fstab
#chroot /mnt 
arch-chroot /mnt
