#!/bin/bash

username=neo
pass=1811

#pacman -Sy
sudo pacman -Sy
#xorg
sudo pacman –S xorg-server
#timezone
sudo timedatectl set-timezone Asia/Krasnoyarsk
#nvidia
sudo pacman -S nvidia-dkms nvidia-utils opencl-nvidia nvidia-settings lib32-opencl-nvidia lib32-nvidia-utils
#kde and drivers
sudo pacman –S dolphin dolphin-plugins konsole plasma plasma-desktop kdenlive gwenview elisa mpv kcalc kcalendarcore kdeconnect plasma-wayland-session kwalletmanager sddm bluez-utils libva-utils vdpauinfo vulkan-icd-loader lib32-vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools pipewire lib32-pipewire wireplumber pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack qt-gstreamer kdenetwork-filesharing spectacle
#apps
sudo pacman -S firefox gparted engrampa caja p7zip unace brotli rpm-tools cpio latte-dock steam steam-native-runtime obs-studio cuda blender krita qbittorrent telegram-desktop gnome-disk-utility cpupower bash icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-gamemode lib32-openssl meson gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly ffnvcodec-headers samba cifs-utils extra-cmake-modules plasma-framework gst-libav base-devel mpv python-websockets qt5-declarative qt5-websockets qt5-webchannel cmake
#services
sudo systemctl enable sddm
#services
sudo systemctl enable Bluetooth
#services
sudo systemctl enable cpupower
#pikaur
git clone https://aur.archlinux.org/pikaur.git
#pikaur
cd pikaur
#pikaur
makepkg -fsri
#cd
cd
#aur apps
pikaur -S pamac-aur stacer-bin fastfetch timeshift timeshifs-autosnap protonup-qt-bin google-chrome yandex-browser speech-dispatcher ttf-font gstreamer-meta ventoy-bin onlyoffice-bin xow-git libva-nvidia-driver-git --noconfirm
#services
sudo systemctl enable xow
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
#samba
echo '[global' >> /etc/samba/smb.conf
#samba
echo 'usershare path = /var/lib/samba/usershares' >> /etc/samba/smb.conf
#samba
echo 'usershare max shares = 100' >> /etc/samba/smb.conf
#samba
echo 'usershare allow guests = yes' >> /etc/samba/smb.conf
#samba
echo 'usershare owner only = yes' >> /etc/samba/smb.conf
#samba
sudo smbpasswd -a $username
#samba
sudo usermod -g users -G wheel,video $username
#samba
sudo mkdir /var/lib/samba/usershares
#samba
sudo chown root:users /var/lib/samba/usershares
#samba
sudo chmod 1770 /var/lib/samba/usershares
#samba
sudo gpasswd users -a $username
#samba
sudo systemctl enable smb.service
#samba
sudo systemctl enable nmb.service
#portproton
wget -c "https://github.com/Castro-Fidel/PortWINE/raw/master/portwine_install_script/PortProton_1.0" && sh PortProton_1.0 -rus
#mkinitcpio
sudo mkinitcpio -P
#exit
exit
