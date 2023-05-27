#!/bin/bash

username=neo
pass=1811

#services
systemctl enable iwd.service
#services
systemctl enable NetworkManager.service
#install xorg
sudo pacman –S xorg-server
#timezone
sudo timedatectl set-timezone Asia/Krasnoyarsk
#nvidia
sudo pacman -S nvidia-dkms nvidia-utils opencl-nvidia nvidia-settings lib32-opencl-nvidia lib32-nvidia-utils
#install kde and drivers
sudo pacman –S dolphin dolphin-plugins konsole plasma plasma-desktop kdenlive gwenview elisa mpv kcalc kcalendarcore kdeconnect plasma-wayland-session kwalletmanager sddm bluez-utils  libva-vdpau-driver libva-utils vdpauinfo vulkan-icd-loader lib32-vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools pipewire lib32-pipewire wireplumber pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack qt-gstreamer kdenetwork-filesharing spectacle
#install apps
sudo pacman -S firefox gparted engrampa caja p7zip unace brotli rpm-tools cpio latte-dock steam steam-native-runtime obs-studio cuda blender krita qbittorrent telegram-desktop gnome-disk-utility cpupower bash icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-gamemode lib32-openssl meson gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly ffnvcodec-headers samba cifs-utils extra-cmake-modules plasma-framework gst-libav base-devel mpv python-websockets qt5-declarative qt5-websockets qt5-webchannel cmake
#setting cpupower
sudo cpupower frequency-set -g performance
#services
sudo systemctl enable cpupower.service
#services
sudo systemctl enable sddm.service
#services
sudo systemctl enable bluetooth.service
#pikaur
git clone https://aur.archlinux.org/pikaur.git
#pikaur
cd pikaur
#pikaur
makepkg -fsri
#cd
cd
#install apps
pikaur -S libva-nvidia-driver-git
#install apps
pikaur -S pamac-aur stacer-bin fastfetch timeshift timeshifs-autosnap protonup-qt-bin google-chrome yandex-browser speech-dispatcher ttf-font gstreamer-meta ventoy-bin onlyoffice-bin xow-git --noconfirm
#services
sudo systemctl enable xow.service
#enviroment
echo 'NVD_BACKEND=direct' >> /etc/enviroment
#enviroment
echo 'MOZ_DISABLE_RDD_SANDBOX=1' >> /etc/enviroment
#enviroment
echo 'LIBVA_DRIVER_NAME=nvidia' >> /etc/enviroment
#enviroment
echo 'EDITOR=micro' >> /etc/enviroment
#enviroment
echo 'EGL_PLATFORM=wayland' >> /etc/enviroment
#enviroment
echo 'MOZ_ENABLE_WAYLAND=1 firefox' >> /etc/enviroment
#enviroment
echo 'GST_VAAPI_ALL_DRIVERS=1' >> /etc/enviroment
#mkinitcpio
sudo mkinitcpio -P
#exit
reboot