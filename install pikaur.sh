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
#раскомментируйте необходимое:
#aur apps and libva-nvidia-driver:
pikaur -S libva-nvidia-driver-git pamac-aur stacer-bin fastfetch timeshift timeshift-autosnap protonup-qt-bin google-chrome ventoy-bin onlyoffice-bin rate-mirrors-bin xpadneo-dkms latte-dock-git yandex-browser --noconfirm
#aur apps and opencl-amd:
#pikaur -S opencl-amd pamac-aur stacer-bin fastfetch timeshift timeshift-autosnap protonup-qt-bin google-chrome ventoy-bin onlyoffice-bin rate-mirrors-bin xpadneo-dkms latte-dock-git --noconfirm
