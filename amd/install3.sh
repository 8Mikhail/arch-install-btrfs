#!/bin/bash

#Измените на своё:
username=hacker
pass=1811

#setfont cyr-sun16:
setfont cyr-sun16
#xorg:
pacman -S xorg-server --noconfirm
#KDE and apps:
pacman -S plasma plasma-desktop --noconfirm
#pipewire:
pacman -S pipewire lib32-pipewire wireplumber pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack --noconfirm
#KDE drivers and apps:
pacman -S dolphin dolphin-plugins konsole kdenlive gwenview elisa mpv kcalc kcalendarcore kdeconnect plasma-wayland-session kwalletmanager libva-utils vdpauinfo vulkan-icd-loader lib32-vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools qt-gstreamer kdenetwork-filesharing spectacle --noconfirm
#раскомментируйте необходимое:
#apps and nvidia and cuda and libva-vdpau-driver (если не планируете установку libva-nvidia-driver-git):
#pacman -S nvidia-dkms nvidia-utils opencl-nvidia nvidia-settings lib32-opencl-nvidia lib32-nvidia-utils cuda libva-vdpau-driver lib32-libva-vdpau-driver firefox gparted packagekit-qt5 engrampa caja p7zip unace brotli rpm-tools cpio latte-dock steam steam-native-runtime obs-studio blender krita qbittorrent telegram-desktop gnome-disk-utility icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-gamemode lib32-openssl meson gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly ffnvcodec-headers samba cifs-utils extra-cmake-modules plasma-framework gst-libav base-devel mpv python-websockets qt5-declarative qt5-websockets qt5-webchannel cmake --noconfirm
#apps and nvidia and cuda:
#pacman is nvidia-dkms nvidia-utils opencl-nvidia nvidia-settings lib32-opencl-nvidia lib32-nvidia-utils cuda firefox gparted packagekit-qt5 engrampa caja p7zip unace brotli rpm-tools cpio latte-dock steam steam-native-runtime obs-studio blender krita qbittorrent telegram-desktop gnome-disk-utility icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-gamemode lib32-openssl meson gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly ffnvcodec-headers samba cifs-utils extra-cmake-modules plasma-framework gst-libav base-devel mpv python-websockets qt5-declarative qt5-websockets qt5-webchannel cmake --noconfirm
#apps and mesa and libva-mesa-driver:
pacman -S libva-mesa-driver lib32-libva-mesa-driver mesa firefox gparted packagekit-qt5 engrampa caja p7zip unace brotli rpm-tools cpio latte-dock steam steam-native-runtime obs-studio blender krita qbittorrent telegram-desktop gnome-disk-utility icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-gamemode lib32-openssl meson gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly ffnvcodec-headers samba cifs-utils extra-cmake-modules plasma-framework gst-libav base-devel mpv python-websockets qt5-declarative qt5-websockets qt5-webchannel cmake --noconfirm
#sddm:
pacman -S sddm --noconfirm
#bluetooth:
pacman -S bluez bluez-utils --noconfirm
#install cpupower:
pacman -S cpupower --noconfirm
#setting cpupower:
cpupower frequency-set -g performance
#pikaur:
#cd /home/$username/:
cd /home/$username/
git clone https://aur.archlinux.org/pikaur.git
#cd /home/$username/pikaur:
cd /home/$username/pikaur
#install pikaur:
makepkg -fsri --noconfirm
#cd:
cd
#раскомментируйте необходимое:
#aur apps and libva-nvidia-driver:
#pikaur -S libva-nvidia-driver-git pamac-aur stacer-bin fastfetch timeshift timeshift-autosnap protonup-qt-bin google-chrome yandex-browser speech-dispatcher ttf-font gstreamer-meta ventoy-bin onlyoffice-bin xow-git --noconfirm
#aur apps and opencl-amd:
pikaur -S opencl-amd pamac-aur stacer-bin fastfetch timeshift timeshift-autosnap protonup-qt-bin google-chrome yandex-browser speech-dispatcher ttf-font gstreamer-meta ventoy-bin onlyoffice-bin xow-git --noconfirm
#portproton:
#cd /home/$username/:
cd /home/$username/
#install portproton:
wget -c "https://github.com/Castro-Fidel/PortWINE/raw/master/portwine_install_script/PortProton_1.0" && sh PortProton_1.0 -rus
#cd:
cd
#mkinitcpio.conf:
#Раскомментируйте на необходимое:
#nvidia modules:
#sed 's/MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm btrfs)/g' -i /etc/mkinitcpio.conf
#mesa:
sed 's/MODULES=()/MODULES=(btrfs)/g' -i /etc/mkinitcpio.conf
#enviroment:
echo 'NVD_BACKEND=direct' >> /etc/enviroment
#enviroment:
echo 'MOZ_DISABLE_RDD_SANDBOX=1' >> /etc/enviroment
#enviroment nvidia:
#echo 'LIBVA_DRIVER_NAME=nvidia' >> /etc/enviroment
#enviroment:
echo 'EDITOR=micro' >> /etc/enviroment
#enviroment:
echo 'EGL_PLATFORM=wayland' >> /etc/enviroment
#enviroment:
echo 'MOZ_ENABLE_WAYLAND=1 firefox' >> /etc/enviroment
#samba:
echo '[global]' >> /etc/samba/smb.conf
#samba:
echo 'usershare path = /var/lib/samba/usershares' >> /etc/samba/smb.conf
#samba:
echo 'usershare max shares = 100' >> /etc/samba/smb.conf
#samba:
echo 'usershare allow guests = yes' >> /etc/samba/smb.conf
#samba:
echo 'usershare owner only = yes' >> /etc/samba/smb.conf
#samba:
( echo $pass 
  echo $pass ) | smbpasswd -a $username
#samba:
usermod -g users -G wheel,video $username
#samba:
mkdir /var/lib/samba/usershares
#samba:
chown root:users /var/lib/samba/usershares
#samba:
chmod 1770 /var/lib/samba/usershares
#samba:
sudo gpasswd users -a $username
#samba:
systemctl enable smb
#samba:
systemctl enable nmb
#services:
systemctl enable sddm
#services:
systemctl enable bluetooth
#services:
systemctl enable cpupower
#services:
systemctl enable xow
#mkinitcpio:
mkinitcpio IP
#timezone:
timedatectl set-timezone Asia/Krasnoyarsk
#exit:
exit
