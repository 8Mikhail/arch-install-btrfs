#!/bin/bash

#Измените на своё:
username=neo
pass=1811


echo '--------------------------------------------------'
echo '|              Установка драйверов               |'
echo '--------------------------------------------------'
#chown:
( echo $pass )|sudo chown -R $username:users /home/$username
#
sudo btrfs subvolume create /swap
#
sudo btrfs filesystem mkswapfile --size 16g --uuid clear /swap/swapfile
#
echo '/swap/swapfile        none        swap        defaults    0 0' >> /etc/fstab
#
sudo swapon /swap/swapfile
#ВРУЧНУЮ ВВЕДИТЕ ТРИ СТРОЧКИ в FSTAB:
#tmpfs /tmp tmpfs nodev,nosuid 0 0
#tmpfs /var/tmp tmpfs defaults 0 0
#tmpfs /var/log tmpfs defaults 0 0
#ПОПРАВЬ ОПЦИИ У КОРНЯ:
#compress-force,ssd,subvol=@ 0 0
#compress-force,ssd,subvol=@home 0 0
#compress-force,ssd,subvol=@var 0 0
#xorg:
sudo pacman -S xorg-server
#wget:
sudo pacman -S wget
#KDE and apps:
sudo pacman -S plasma plasma-desktop breeze breeze-gtk kde-gtk-config sddm
#nvidia and cuda:
sudo pacman -S nvidia-dkms nvidia-utils opencl-nvidia nvidia-settings lib32-opencl-nvidia lib32-nvidia-utils cuda libva-vdpau-driver lib32-libva-vdpau-driver libva-utils vdpauinfo
#KDE drivers and apps:
sudo pacman -S dolphin konsole kdenlive gwenview elisa mpv kcalc kcalendarcore kdeconnect plasma-wayland-session egl-wayland kwalletmanager kdenetwork-filesharing samba spectacle
#apps:
sudo pacman -S firefox gparted packagekit-qt5 ark engrampa caja p7zip unace brotli rpm-tools cpio steam steam-native-runtime obs-studio blender krita qbittorrent telegram-desktop gnome-disk-utility
#apps:
sudo pacman -S meson cifs-utils extra-cmake-modules gst-libav base-devel mpv vlc elisa python-websockets qt5-declarative qt5-websockets qt5-webchannel cmake
#apps:
sudo pacman -S qt-gstreamer gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly ffnvcodec-headers
#pipewire:
sudo pacman -S pipewire lib32-pipewire wireplumber pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack
#bluetooth:
sudo pacman -S bluez bluez-utils
#install cpupower:
sudo pacman -S cpupower
#setting cpupower:
sudo cpupower frequency-set -g performance
#
sudo sed -i "s|#governor='ondemand'|governor='performance'|g" /etc/default/cpupower
#mkinitcpio.conf:
#Раскомментируйте на необходимое:
#nvidia modules:
sudo sed -i 's|MODULES=()|MODULES="nvidia nvidia_modeset nvidia_uvm nvidia_drm btrfs"|g' /etc/mkinitcpio.conf
#grub:
sudo sed -i 's|GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"|GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia-drm.modeset=1"|g' /etc/default/grub
#kwin:
sudo echo "KWIN_DRM_USE_EGL_STREAMS=1" >> .profile
#enviroment:
sudo echo 'NVD_BACKEND=direct' >> /etc/enviroment
#enviroment:
sudo echo 'MOZ_DISABLE_RDD_SANDBOX=1' >> /etc/enviroment
#enviroment nvidia:
sudo echo 'LIBVA_DRIVER_NAME=nvidia' >> /etc/enviroment
#enviroment:
sudo echo 'EDITOR=micro' >> /etc/enviroment
#enviroment:
sudo echo 'EGL_PLATFORM=wayland' >> /etc/enviroment
#enviroment:
sudo echo 'MOZ_ENABLE_WAYLAND=1 firefox' >> /etc/enviroment
#services:
sudo systemctl enable sddm
#services:
sudo systemctl enable bluetooth
#services:
sudo systemctl enable cpupower
#grub:
sudo grub-mkconfig -o /boot/grub/grub.cfg
#mkinitcpio:
sudo mkinitcpio -P
#exit:
exit
