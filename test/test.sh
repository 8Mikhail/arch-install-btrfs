#lsblk
lsblk
#форматирую диск
mkfs.btrfs -f /dev/sdc2
#mount mnt
mount /dev/sdc2 /mnt
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
mount -o noatime,compress=zstd:3,space_cache=v2,discard=async,subvol=@ /dev/sdc2 /mnt
#mkdir folders
mkdir /mnt/{var,home,boot}
#mkdir /boot/efi
mkdir /mnt/boot/efi
#mount disk
mount -o noatime,compress=zstd:3,space_cache=v2,discard=async,subvol=@home /dev/sdc2 /mnt/home
#mount disk
mount -o noatime,compress=zstd:3,space_cache=v2,discard=async,subvol=@var /dev/sdc2 /mnt/var
