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
#services
systemctl enable iwd.service
#services
systemctl enable NetworkManager.service
#mount
mount /dev/sdc2 /boot/efi
#hostname
echo $hostname >> /etc/hostname
#locale eng
sed -i 's/#en_US.U/en_US.U/g' /etc/locale.gen
#locale rus
sed -i 's/#ru_RU.U/ru_RU.U/g' /etc/locale.gen
#locale-gen
locale-gen
#locale
echo LANG=en_US.UTF-8 >> /etc/locale.conf
#locale
echo LANG=ru_RU.UTF-8 >> /etc/locale.conf
#passwd
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
echo '%wheel ALL=(ALL:ALL) ALL' >> /etc/sudoers
#isntall core
pacman-key --keyserver hkps://keyserver.ubuntu.com --recv-keys 9AE4078033F8024D
#install core
pacman-key --lsign-key 9AE4078033F8024D
#/etc/pacman.conf
echo '[liquorix]' >> /etc/pacman.conf
#/etc/pacman.conf
echo 'Server = https://liquorix.net/archlinux/$repo/$arch' >> /etc/pacman.conf
#/etc/pacman.conf
sed '/#ParallelDownloads = 5/s/^#//' -i /etc/pacman.conf
#/etc/pacman.conf
echo -e '[multilib]' >> /etc/pacman.conf
#/etc/pacman.conf
echo -e 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
# pacman -Sy
pacman -Sy
#install core
pacman -S linux-lqx linux-lqx-headers --noconfirm
#blkid
blkid /dev/sdc3
