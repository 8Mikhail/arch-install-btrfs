#!/bin/bash

#Измените на своё:
username=neo
pass=1811
sleep=5


echo '--------------------------------------------------'
echo '|          Установка Wallpaper Engine             |'
echo '--------------------------------------------------'
#sleep:
sleep $sleep
#####sudo pacman -S extra-cmake-modules plasma-framework gst-libav base-devel mpv python-websockets qt5-declarative qt5-websockets qt5-webchannel vulkan-headers cmake
Download source
git clone https://github.com/catsout/wallpaper-engine-kde-plugin.git
cd wallpaper-engine-kde-plugin

# Download submodule (glslang)
git submodule update --init

# Configure
# 'USE_PLASMAPKG=ON': using plasmapkg2 tool to install plugin
mkdir build && cd build
cmake .. -DUSE_PLASMAPKG=ON

# Build
make -j$nproc

# Install package (ignore if USE_PLASMAPKG=OFF for system-wide installation)
make install_pkg
# install lib
sudo make install
#
exit
