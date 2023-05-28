Проект создан для упрощения установки системы Arch Linux.

Инструкция:

1)Проверьте файлы и исправьте нужные строки на свои, сохраните;

2)При запуске Live-CD arhlinux подключитесь к интернету и введите " pacman -Sy ";

3)После введения " pacman -Sy " установите git с помощью команды " pacman -S git ";

4)Введите " git clone https://github.com/8Mikhail/arch-install-btrfs.git ";

5)Введите " bash  arch-install-btrfs/install.sh ";

6)Когда будете в " arch-chroot /mnt ", выполните пункт 4;

7)Введите " bash /arch-install-btrfs/install2.sh ";

8)Введите " exit " и перезагрузитесь с помощью команды " reboot ";

9)После ввода логина и пароля введите " bash /home/$username/arch-install-btrfs/install3.sh ";

10)Перезагружаемся с помощью команды " reboot ".
