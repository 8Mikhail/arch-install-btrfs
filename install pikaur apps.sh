#install pikaur:
git clone https://aur.archlinux.org/pikaur.git
#install pikaur:
cd pikaur
#pikaur:
(
    echo $pass
) | makepkg -fsri --noconfirm
#cd:
cd
#remove vdpau:
sudo pacman -R libva-vdpau-driver --noconfirm
#
#aur apps and libva-nvidia-driver:
pikaur -S libva-nvidia-driver-git stacer-bin fastfetch timeshift timeshift-autosnap protonup-qt-bin google-chrome ventoy-bin onlyoffice-bin rate-mirrors-bin yandex-browser
#
pikaur -S xpadneo-dkms
#rate-mirror:
rate-mirrors --protocol=https arch | sudo tee /etc/pacman.d/mirrorlist
