#!/bin/bash

echo '--------------------------------------------------'
echo '|                Config Install                  |'
echo '--------------------------------------------------'
username=hacker
hostname=world
pass=1811
disk_root=/dev/nvme0n1p4
disk_boot=/dev/nvme0n1p1
ucode=intel-ucode
sleep=5

#setfont cyr-sun16 
setfont cyr-sun16
echo '--------------------------------------------------'
echo '|              Install Arch Linux                |'
echo '--------------------------------------------------'
echo 'Install Arch Linux '$username'@'$hostname'		'
echo '--------------------------------------------------'
echo '--------------------------------------------------'
echo '|             Форматирование диска               |'
echo '--------------------------------------------------'
echo 'Format disk '$disk_root'@'$disk_boot'				'
echo '--------------------------------------------------'

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
#sleep
sleep $sleep
#sleep
echo '--------------------------------------------------'
echo '|             Монтирование разделов               |'
echo '--------------------------------------------------'
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
#sleep
sleep $sleep
#sleep
echo '--------------------------------------------------'
echo '|             Установка Arch Linux                |'
echo '--------------------------------------------------'
#install arch
pacstrap -K /mnt base base-devel linux-firmware refind efibootmgr iwd networkmanager micro htop btrfs-progs git $ucode zsh --noconfirm
#fstab generation
genfstab -U -p /mnt >> /mnt/etc/fstab
#chroot
mkdir -p /mnt/home/$username/
#chroot
cp -f arch-install-btrfs/install.sh /mnt/home/$username/
#chroot
cp -f arch-install-btrfs/install2.sh /mnt/home/$username/
#chroot
cp -f arch-install-btrfs/install3.sh /mnt/home/$username/
#sleep
sleep $sleep
#chroot /mnt 
arch-chroot /mnt sh -c "$(cat /mnt/home/$username/install2.sh)" $username $hostname $pass
#sleep
sleep $sleep

echo '--------------------------------------------------'
echo '|                 Перезагрузка                   |'
echo '--------------------------------------------------'
umount -R /mnt/
reboot
