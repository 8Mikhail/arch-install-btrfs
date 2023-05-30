#!/bin/bash

#Измените на своё
username=hacker
pass=1811
#Раскомментируйте на необходимое 
#nvidia=nvidia-dkms nvidia-utils opencl-nvidia nvidia-settings lib32-opencl-nvidia lib32-nvidia-utils
#libva-mesa=libva-mesa-driver lib32-libva-mesa-driver
#libva-vdpau=libva-vdpau-driver lib32-libva-vdpau-driver
libva=libva-nvidia-driver-git
#cuda=cuda
opencl=opencl-amd

#setfont cyr-sun16
setfont cyr-sun16
#xorg
sudo pacman -S xorg-server --noconfirm
#timezone
sudo timedatectl set-timezone Asia/Krasnoyarsk
#mesa
sudo pacman -S mesa --noconfirm
#pipewire
sudo pacman -S pipewire lib32-pipewire wireplumber pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack --noconfirm
#KDE and apps
sudo pacman -S plasma plasma-desktop --noconfirm
#KDE drivers and apps
sudo pacman -S dolphin dolphin-plugins konsole kdenlive gwenview elisa mpv kcalc kcalendarcore kdeconnect plasma-wayland-session kwalletmanager libva-utils vdpauinfo vulkan-icd-loader lib32-vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools qt-gstreamer kdenetwork-filesharing spectacle --noconfirm
#apps
sudo pacman is $nvidia $libva-mesa $libva-vdpau firefox gparted engrampa caja p7zip unace brotli rpm-tools cpio latte-dock steam steam-native-runtime obs-studio $cuda blender krita qbittorrent telegram-desktop gnome-disk-utility cpupower icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-gamemode lib32-openssl meson gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly ffnvcodec-headers samba cifs-utils extra-cmake-modules plasma-framework gst-libav base-devel mpv python-websockets qt5-declarative qt5-websockets qt5-webchannel cmake ntfs-3g --noconfirm
#sddm
sudo pacman -S sddm --noconfirm
#bluetooth
sudo pacman -S bluez bluez-utils --noconfirm
#services
sudo systemctl enable sddm
#services
sudo systemctl enable bluetooth
#setting cpupower
sudo cpupower frequency-set -g performance
#services
sudo systemctl enable cpupower
#pikaur
function aur { 
         cd /tmp 
         git clone https://aur.archlinux.org/pikaur.git
         chown -R $username:users /tmp/pikaur
         chown -R $username:users /tmp/pikaur/PKGBUILD
         cd pikaur
         ( echo $pass ) | -u $username makepkg -fsri --noconfirm
         cd .. 
         rm -rf pikaur 
 }
#aur apps
aur $libva $opencl pamac-aur stacer-bin fastfetch timeshift timeshift-autosnap protonup-qt-bin google-chrome yandex-browser speech-dispatcher ttf-font gstreamer-meta ventoy-bin onlyoffice-bin xow-git --noconfirm
#services
sudo systemctl enable xow
#portproton
wget -c "https://github.com/Castro-Fidel/PortWINE/raw/master/portwine_install_script/PortProton_1.0" && sh PortProton_1.0 -rus
#mkinitcpio.conf
#Раскомментируйте на необходимое
#nvidia modules
#sudo sed 's/MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm btrfs)/g' -i /etc/mkinitcpio.conf
#mesa
sudo sed 's/MODULES=()/MODULES=(btrfs)/g' -i /etc/mkinitcpio.conf
#root
( 
     echo $pass 
     echo $pass 
 ) |su
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
#samba
echo '[global]' >> /etc/samba/smb.conf
#samba
echo 'usershare path = /var/lib/samba/usershares' >> /etc/samba/smb.conf
#samba
echo 'usershare max shares = 100' >> /etc/samba/smb.conf
#samba
echo 'usershare allow guests = yes' >> /etc/samba/smb.conf
#samba
echo 'usershare owner only = yes' >> /etc/samba/smb.conf
#samba
( 
     echo $pass 
     echo $pass 
 ) | smbpasswd -a $username
#samba
usermod -g users -G wheel,video $username
#samba
mkdir /var/lib/samba/usershares
#samba
chown root:users /var/lib/samba/usershares
#samba
chmod 1770 /var/lib/samba/usershares
#samba
gpasswd users -a $username
#samba
systemctl enable smb
#samba
systemctl enable nmb
#mkinitcpio
mkinitcpio -P
#exit
exit
