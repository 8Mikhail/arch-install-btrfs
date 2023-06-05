#!/bin/bash

#Измените на своё:
username=neo
pass=1811

function aur {
	cd /tmp
	git clone https://aur.archlinux.org/pikaur.git
	chown -R $username:users /tmp/pikaur
	chown -R $username:users /tmp/pikaur/PKGBUILD
	cd pikaur
	( echo $pass ) | -u $username makepkg -si --noconfirm
	cd ..
	rm -rf pikaur
}
#setfont cyr-sun16:
setfont cyr-sun16
#xorg:
sudo pacman -S xorg-server --noconfirm
#enviroment
sudo pacman -S gnu-free-fonts --noconfirm
#pipewire:
sudo pacman -S pipewire lib32-pipewire wireplumber pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack --noconfirm
#KDE and apps:
sudo pacman -S plasma plasma-desktop --noconfirm
#KDE drivers and apps:
sudo pacman -S dolphin dolphin-plugins konsole kdenlive gwenview elisa mpv kcalc kcalendarcore kdeconnect plasma-wayland-session kwalletmanager libva-utils vdpauinfo vulkan-icd-loader lib32-vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools qt-gstreamer kdenetwork-filesharing spectacle --noconfirm
#раскомментируйте необходимое:
#apps and nvidia and cuda and libva-vdpau-driver (если не планируете установку libva-nvidia-driver-git):
#sudo pacman -S nvidia-dkms nvidia-utils opencl-nvidia nvidia-settings lib32-opencl-nvidia lib32-nvidia-utils cuda libva-vdpau-driver lib32-libva-vdpau-driver firefox gparted packagekit-qt5 engrampa caja p7zip unace brotli rpm-tools cpio latte-dock steam steam-native-runtime obs-studio blender krita qbittorrent telegram-desktop gnome-disk-utility icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-gamemode lib32-openssl meson gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly ffnvcodec-headers samba cifs-utils extra-cmake-modules plasma-framework gst-libav base-devel mpv python-websockets qt5-declarative qt5-websockets qt5-webchannel cmake --noconfirm
#apps and nvidia and cuda:
sudo pacman -S nvidia-dkms nvidia-utils opencl-nvidia nvidia-settings lib32-opencl-nvidia lib32-nvidia-utils cuda firefox gparted packagekit-qt5 engrampa caja p7zip unace brotli rpm-tools cpio latte-dock steam steam-native-runtime obs-studio blender krita qbittorrent telegram-desktop gnome-disk-utility icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-gamemode lib32-openssl meson gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly ffnvcodec-headers samba cifs-utils extra-cmake-modules plasma-framework gst-libav base-devel mpv python-websockets qt5-declarative qt5-websockets qt5-webchannel cmake --noconfirm
#apps and mesa and libva-mesa-driver:
#sudo pacman -S libva-mesa-driver lib32-libva-mesa-driver mesa firefox gparted packagekit-qt5 engrampa caja p7zip unace brotli rpm-tools cpio latte-dock steam steam-native-runtime obs-studio blender krita qbittorrent telegram-desktop gnome-disk-utility icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-gamemode lib32-openssl meson gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly ffnvcodec-headers samba cifs-utils extra-cmake-modules plasma-framework gst-libav base-devel mpv python-websockets qt5-declarative qt5-websockets qt5-webchannel cmake --noconfirm
#sddm:
sudo pacman -S sddm --noconfirm
#bluetooth:
sudo pacman -S bluez bluez-utils --noconfirm
#install cpupower:
sudo pacman -S cpupower --noconfirm
#setting cpupower:
sudo cpupower frequency-set -g performance
#install pikaur:
aur -S auracle-git
#install pikaur:
aur -S pikaur
#раскомментируйте необходимое:
#aur apps and libva-nvidia-driver:
aur -S libva-nvidia-driver-git pamac-aur stacer-bin fastfetch timeshift timeshift-autosnap protonup-qt-bin google-chrome yandex-browser speech-dispatcher ttf-font gstreamer-meta ventoy-bin onlyoffice-bin xow-git --noconfirm
#aur apps and opencl-amd:
#aur -S opencl-amd pamac-aur stacer-bin fastfetch timeshift timeshift-autosnap protonup-qt-bin google-chrome yandex-browser speech-dispatcher ttf-font gstreamer-meta ventoy-bin onlyoffice-bin xow-git --noconfirm
#install portproton:
#cd /home/$username/
#install:
wget -c "https://github.com/Castro-Fidel/PortWINE/raw/master/portwine_install_script/PortProton_1.0" && sh PortProton_1.0 -rus
#cd:
cd
#mkinitcpio.conf:
#Раскомментируйте на необходимое:
#nvidia modules:
sudo sed 's/MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm btrfs)/g' -i /etc/mkinitcpio.conf
#mesa:
#sudo sed 's/MODULES=()/MODULES=(btrfs)/g' -i /etc/mkinitcpio.conf
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
sudo usermod -m -g users -G wheel,video $username
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
#services:
sudo systemctl enable xow
#mkinitcpio:
sudo mkinitcpio -P
#timezone:
sudo timedatectl set-timezone Asia/Krasnoyarsk
#exit:
exit
