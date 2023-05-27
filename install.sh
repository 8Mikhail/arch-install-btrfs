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
mkdir -p /mnt/home/$username/
#chroot /mnt
cp -f install.sh /mnt/home/$username/
#chroot /mnt
cp -f chroot.sh /mnt/home/$username/
#chroot /mnt 
arch-chroot /mnt sh -c "$(cat chroot)" $username $hostname $pass
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
