#!/bin/bash

echo '--------------------------------------------------------------------------------'
echo '|                               Config Install                                 |'
echo '--------------------------------------------------------------------------------'
username=neo
hostname=matrix
pass=1811

echo '--------------------------------------------------------------------------------'
echo ' Install Arch Linux '$username'@'$hostname
echo '--------------------------------------------------------------------------------'

#formating disk
mkfs.btrfs -f /dev/sdc3
#formating disk
mkfs.vfat /dev/sdc2
#mount mnt
mount /dev/sdc3 /mnt
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
mount -o noatime,compress=zstd:3,space_cache=v2,discard=async,subvol=@ /dev/sdc3 /mnt
#mkdir folders
mkdir /mnt/{var,home,boot}
#mkdir /boot/efi
mkdir /mnt/boot/efi
#mount disk
mount -o noatime,compress=zstd:3,space_cache=v2,discard=async,subvol=@home /dev/sdc3 /mnt/home
#mount disk
mount -o noatime,compress=zstd:3,space_cache=v2,discard=async,subvol=@var /dev/sdc3 /mnt/var
#install arch
pacstrap -K /mnt base base-devel linux-firmware refind efibootmgr iwd networkmanager micro htop btrfs-progs git intel-ucode zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions grml-zsh-config iucode-tool --noconfirm
#fstab generation
genfstab -U -p /mnt >> /mnt/etc/fstab
#chroot /mnt 
arch-chroot /mnt
