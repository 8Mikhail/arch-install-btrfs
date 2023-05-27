#formating disk
mkfs.btrfs -f /dev/sdc3
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
pacstrap -K -i /mnt base base-devel linux-firmware refind efibootmgr iwd networkmanager micro htop btrfs-progs git intel-ucode zsh iucode-tool
#chroot /mnt
arch-chroot /mnt
#services
sudo systemctl enable iwd.service
#services
sudo systemctl enable NetworkManager.service
#hostname
echo matrix >> /etc/hostname
#locale eng
sed '/en_US.UTF-8/s/^#//' -i /etc/locale.gen
#locale rus
sed '/ru_RU.UTF-8/s/^#//' -i /etc/locale.gen
#locale-gen
locale-gen
#locale
echo LANG=en_US.UTF-8 >> /etc/locale.conf
#locale
echo LANG=ru_RU.UTF-8 >> /etc/locale.conf
#passwd
passwd
#add user
useradd -m -g users -G wheel,video -s /bin/bash neo
#passwd user
passwd neo
#sudoers
sed '/# %wheel ALL=(ALL:ALL) ALL/s/^#//' -i /etc/sudoers
#exit
exit
#fstab generation
genfstab -U -p /mnt >> /mnt/etc/fstab
#chroot /mnt
arch-chroot /mnt
#mount boot
mount /dev/sdc2 /boot/efi
#isntall core
sudo pacman-key --keyserver hkps://keyserver.ubuntu.com --recv-keys 9AE4078033F8024D
#install core
sudo pacman-key --lsign-key 9AE4078033F8024D
#/etc/pacman.conf
echo [liquorix] >> /etc/pacman.conf
#/etc/pacman.conf
echo Server = https://liquorix.net/archlinux/$repo/$arch >> /etc/pacman.conf
#/etc/pacman.conf
sed '/#ParallelDownloads = 5/s/^#//' -i /etc/pacman.conf
#/etc/pacman.conf
sed '/#[multilib]/s/^#//' -i /etc/pacman.conf
#/etc/pacman.conf
sed '/#Include = /etc/pacman.d/mirrorlist/s/^#//' -i /etc/pacman.conf
# pacman -Sy
pacman -Sy
#install core
sudo pacman -S linux-lqx linux-lqx-headers
#blkid
blkid /dev/sdc3
