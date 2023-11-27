#install portproton:
username=neo
pass=1811

#УСТАНОВИТЕ:
sudo pacman -Syu bash icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver vulkan-icd-loader lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-vulkan-icd-loader lib32-gamemode lib32-openssl
#
#wget -c "https://github.com/Castro-Fidel/PortWINE/raw/master/portwine_install_script/PortProton_1.0" && sh PortProton_1.0 rus
git clone https://github.com/Castro-Fidel/PortProton_ALt.git && sh /home/$username/PortProton_ALt/portproton
