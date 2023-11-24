#!/bin/bash

#Измените на своё:
username=neo
pass=1811


echo '--------------------------------------------------'
echo '|              Установка драйверов               |'
echo '--------------------------------------------------'
#chown:
( echo $pass )|sudo chown -R $username:users /home/$username
#xorg:
sudo pacman -S xorg-server
#wget:
sudo pacman -S wget
#KDE and apps:
sudo pacman -S plasma plasma-desktop breeze breeze-gtk kde-gtk-config sddm
#KDE drivers and apps:
sudo pacman -S dolphin konsole kdenlive gwenview elisa mpv kcalc kcalendarcore kdeconnect plasma-wayland-session kwalletmanager kdenetwork-filesharing samba spectacle
#nvidia and cuda:
sudo pacman -S nvidia-dkms nvidia-utils opencl-nvidia nvidia-settings lib32-opencl-nvidia lib32-nvidia-utils cuda libva-vdpau-driver lib32-libva-vdpau-driver libva-utils vdpauinfo
#apps:
sudo pacman -S firefox gparted packagekit-qt5 ark engrampa caja p7zip unace brotli rpm-tools cpio steam steam-native-runtime obs-studio blender krita qbittorrent telegram-desktop gnome-disk-utility icoutils
#apps:
sudo pacman -S bubblewrap lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-openssl meson cifs-utils extra-cmake-modules gst-libav base-devel mpv
#apps:
sudo pacman -S python-websockets qt5-declarative qt5-websockets qt5-webchannel cmake
#apps:
sudo pacman -S zstd cabextract bc tar openssl gamemode lib32-gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr lsof lib32-freetype2
#vulkan:
sudo pacman -S vulkan-driver lib32-vulkan-driver vulkan-icd-loader lib32-vulkan-icd-loader
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
#mkinitcpio.conf:
#Раскомментируйте на необходимое:
#nvidia modules:
sudo sed -i 's|MODULES=()|MODULES="nvidia nvidia_modeset nvidia_uvm nvidia_drm btrfs"|g' /etc/mkinitcpio.conf
#grub:
sudo sed -i 's|GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"|GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia-drm.modeset=1"|g' /etc/default/grub
#grub:
sudo grub-mkconfig -o /boot/grub/grub.cfg
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
#samba:
sudo echo '[global]' >> /etc/samba/smb.conf
#samba:
sudo echo 'usershare path = /var/lib/samba/usershares' >> /etc/samba/smb.conf
#samba:
sudo echo 'usershare max shares = 100' >> /etc/samba/smb.conf
#samba:
sudo echo 'usershare allow guests = yes' >> /etc/samba/smb.conf
#samba:
sudo echo 'usershare owner only = yes' >> /etc/samba/smb.conf
#samba:
(  echo $pass 
   echo $pass ) | sudo smbpasswd -a $username
#samba:
sudo usermod -g users -G wheel $username
#samba:
sudo mkdir /var/lib/samba/usershares
#samba:
sudo chown root:users /var/lib/samba/usershares
#samba:
sudo chmod 1770 /var/lib/samba/usershares
#samba:
sudo gpasswd users -a $username
#samba:
sudo systemctl enable smb
#samba:
sudo systemctl enable nmb
#services:
sudo systemctl enable sddm
#services:
sudo systemctl enable bluetooth
#services:
sudo systemctl enable cpupower
#mkinitcpio:
sudo mkinitcpio -P
#exit:
exit
