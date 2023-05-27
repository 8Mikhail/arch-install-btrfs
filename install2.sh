#!/bin/bash

username=neo
hostname=matrix
pass=1811
disk_root=/dev/sda3
disk_boot=/dev/sda2

#services
systemctl enable iwd.service
#services
systemctl enable NetworkManager.service
#mount
mount $disk_boot /boot/efi
#hostname
echo $hostname >> /etc/hostname
#locale eng
sed -i 's/#en_US.U/en_US.U/g' /etc/locale.gen
#locale rus
sed -i 's/#ru_RU.U/ru_RU.U/g' /etc/locale.gen
#locale generation
locale-gen
#locale conf
echo LANG=en_US.UTF-8 >> /etc/locale.conf
#locale conf
echo LANG=ru_RU.UTF-8 >> /etc/locale.conf
#passed root
(
    echo $pass
    echo $pass
) | passwd
#add user
useradd -m -g users -G wheel,video -s /bin/bash $username
#passwd user
(
    echo $pass
    echo $pass
) | passwd $username
#sudoers
sed '/# %wheel ALL=(ALL:ALL) ALL/s/^#//' -i /etc/sudoers
#isntall core lqx
pacman-key --keyserver hkps://keyserver.ubuntu.com --recv-keys 9AE4078033F8024D
#install core lqx
pacman-key --lsign-key 9AE4078033F8024D
#install core lqx
echo '[liquorix]' >> /etc/pacman.conf
#install core lqx
echo 'Server = https://liquorix.net/archlinux/$repo/$arch' >> /etc/pacman.conf
#pacman.conf
sed '/#ParallelDownloads = 5/s/^#//' -i /etc/pacman.conf
#pacman.conf
sed '/[multilib]/s/^#//' -i /etc/pacman.conf
#pacman.conf
sed '/Include = /etc/pacman.d/mirrorlist/s/^#//' -i /etc/pacman.conf
#pacman -Sy
pacman -Sy
#install core lqx
pacman -S linux-lqx linux-lqx-headers --noconfirm
#blkid
uuid=$(blkid -s UUID -o value $disk_root)
#refind
echo '“Boot to standard options” “rw root=UUID='$uuid' rootflags=subvol=@ loglevel=0 quiet splash rootfstype=btrfs nvidia-drm.modeset=1"' >> /boot/refind_linux.conf
#refind
echo '"Boot to single-user mode” “rw root=UUID='$uuid' rootflags=subvol=@ loglevel=0 quiet splash rootfstype=btrfs nvidia-drm.modeset=1 single"' >> /boot/refind_linux.conf
#refind
echo '"Boot with minimal options" "ro root='$disk_root'"' >> /boot/refind_linux.conf
#refind
refind-install
#mkinitcpio
mkinitcpio -P
#exit
exit
