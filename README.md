Проект создан для упрощения установки системы Arch Linux.

Инструкция:

1)Отредактируйте строки "username=" "hostname=" "pass=" "disk_root=" "disk_boot=" по необходимости в трех sh-файлах в папке AMD или NVIDIA перед началом установки;

2)При запуске Live-CD arhlinux подключитесь к интернету и введите " pacman -Sy ";

3)После введения " pacman -Sy " установите git с помощью команды " pacman -S git ";

4)Введите " git clone https://github.com/8Mikhail/arch-install-btrfs.git ";

5)Введите " bash  arch-install-btrfs/amd/install.sh " если нужно установить для AMD;

6)Введите " bash  arch-install-btrfs/nvidia/install.sh " если нужно установить для Nvidia;

7)Ожидаем окончания установки системы.
