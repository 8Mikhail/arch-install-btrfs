#!/bin/bash

#Измените на своё:
username=neo
pass=1811
amd=mesa lib32-mesa libva-mesa-driver lib32-libva-mesa-driver
nvidia=nvidia-dkms nvidia-utils opencl-nvidia nvidia-settings lib32-opencl-nvidia lib32-nvidia-utils cuda libva-vdpau-driver lib32-libva-vdpau-driver
nvidia_no_vdpau_nvidia=nvidia-dkms nvidia-utils opencl-nvidia nvidia-settings lib32-opencl-nvidia lib32-nvidia-utils cuda

#install zsh:
echo '--------------------------------------------------'
echo '|            Установка оболочки zsh              |'
echo '--------------------------------------------------'
#zsh
sudo pacman -S zsh --noconfirm
#oh-my-zsh
curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
#chsh
(  echo $pass 
   echo $pass ) | chsh -s /usr/bin/zsh
#chsh
(  echo $pass 
   echo $pass ) | sudo chsh -s /usr/bin/zsh
#
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
#
mv zsh-syntax-highlighting .zsh-syntax-highlighting
#
echo "source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
#
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#
sudo sed 's|# export PATH=$HOME/bin:/usr/local/bin:$PATH|export PATH=$HOME/bin:/usr/local/bin:$PATH|g' -i ~/.zshrc
#
sudo sed 's|plugins=(git)|plugins=(git zsh-autosuggestions sudo)|g' -i .zshrc
#
source .zshrc
echo '--------------------------------------------------'
echo '|              Установка драйверов               |'
echo '--------------------------------------------------'
#xorg:
sudo pacman -S xorg-server --noconfirm
#enviroment
sudo pacman -S gnu-free-fonts --noconfirm
#pipewire:
sudo pacman -S pipewire lib32-pipewire wireplumber pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack --noconfirm
#KDE and apps:
sudo pacman -S plasma plasma-desktop breeze breeze-gtk kde-gtk-config --noconfirm
#KDE drivers and apps:
sudo pacman -S dolphin dolphin-plugins konsole kdenlive gwenview elisa mpv kcalc kcalendarcore kdeconnect plasma-wayland-session kwalletmanager libva-utils vdpauinfo qt-gstreamer kdenetwork-filesharing spectacle --noconfirm
#раскомментируйте необходимое:
#apps and nvidia and cuda and libva-vdpau-driver (если не планируете установку libva-nvidia-driver-git):
#sudo pacman -S $nvidia firefox gparted packagekit-qt5 engrampa caja p7zip unace brotli rpm-tools cpio latte-dock steam steam-native-runtime obs-studio blender krita qbittorrent telegram-desktop gnome-disk-utility bash icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver vulkan-icd-loader lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-vulkan-icd-loader lib32-gamemode lib32-openssl meson gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly ffnvcodec-headers samba cifs-utils extra-cmake-modules plasma-framework gst-libav base-devel mpv python-websockets qt5-declarative qt5-websockets qt5-webchannel cmake --noconfirm
#apps and nvidia and cuda:
#sudo pacman -S $nvidia_no_vdpau_nvidia firefox gparted packagekit-qt5 engrampa caja p7zip unace brotli rpm-tools cpio latte-dock steam steam-native-runtime obs-studio blender krita qbittorrent telegram-desktop gnome-disk-utility bash icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver vulkan-icd-loader lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-vulkan-icd-loader lib32-gamemode lib32-openssl meson gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly ffnvcodec-headers samba cifs-utils extra-cmake-modules plasma-framework gst-libav base-devel mpv python-websockets qt5-declarative qt5-websockets qt5-webchannel cmake --noconfirm
#apps and mesa and libva-mesa-driver:
sudo pacman -S $amd firefox gparted packagekit-qt5 engrampa caja p7zip unace brotli rpm-tools cpio latte-dock steam steam-native-runtime obs-studio blender krita qbittorrent telegram-desktop gnome-disk-utility bash icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver vulkan-icd-loader lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-vulkan-icd-loader lib32-gamemode lib32-openssl meson gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly ffnvcodec-headers samba cifs-utils extra-cmake-modules plasma-framework gst-libav base-devel mpv python-websockets qt5-declarative qt5-websockets qt5-webchannel cmake --noconfirm
#sddm:
sudo pacman -S sddm --noconfirm
#bluetooth:
sudo pacman -S bluez bluez-utils --noconfirm
#install cpupower:
sudo pacman -S cpupower --noconfirm
#setting cpupower:
sudo cpupower frequency-set -g performance
#cd:
cd /home/$username/
#install pikaur:
git clone https://aur.archlinux.org/pikaur.git
#install pikaur:
cd pikaur
#pikaur:
(  echo $pass 
   echo $pass ) | makepkg -fsri --noconfirm
#cd:
cd
#раскомментируйте необходимое:
#aur apps and libva-nvidia-driver:
#pikaur -S libva-nvidia-driver-git pamac-aur stacer-bin fastfetch timeshift timeshift-autosnap protonup-qt-bin google-chrome yandex-browser speech-dispatcher ttf-font gstreamer-meta ventoy-bin onlyoffice-bin rate-mirrors-bin xpadneo-dkms --noconfirm
#aur apps and opencl-amd:
pikaur -S opencl-amd pamac-aur stacer-bin fastfetch timeshift timeshift-autosnap protonup-qt-bin google-chrome yandex-browser speech-dispatcher ttf-font gstreamer-meta ventoy-bin onlyoffice-bin rate-mirrors-bin xpadneo-dkms --noconfirm
#cd:
cd /home/$username/
#install portproton:
wget -c "https://github.com/Castro-Fidel/PortWINE/raw/master/portwine_install_script/PortProton_1.0" && sh PortProton_1.0 rus
#cd:
cd
#mkinitcpio.conf:
#Раскомментируйте на необходимое:
#nvidia modules:
#sudo sed 's/MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm btrfs)/g' -i /etc/mkinitcpio.conf
#mesa:
sudo sed 's/MODULES=()/MODULES=(btrfs)/g' -i /etc/mkinitcpio.conf
#enviroment:
sudo echo 'NVD_BACKEND=direct' >> /etc/enviroment
#enviroment:
sudo echo 'MOZ_DISABLE_RDD_SANDBOX=1' >> /etc/enviroment
#enviroment nvidia:
#sudo echo 'LIBVA_DRIVER_NAME=nvidia' >> /etc/enviroment
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
( echo $pass 
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
#services:
sudo systemctl enable xow
#mkinitcpio:
sudo mkinitcpio -P
#exit:
exit
