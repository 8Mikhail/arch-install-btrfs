Проект создан для упрощения установки системы Arch Linux. =ПРОЕКТ СЫРОЙ!=

Инструкция:

1)Отредактируйте строки "username=" "hostname=" "pass=" "disk_root=" "disk_boot=" "disk_swap" по необходимости в трех sh-файлах в папке AMD или NVIDIA перед началом установки и раскомментируйте необходимые строки в скриптах;

2)При запуске Live-CD arhlinux подключитесь к интернету по кабелю или же командами для wifi;

Команды для wifi подключения:

-iwctl

-station wlan0 connect название_устройства ИЛИ -station wlan0 connect 'название устройства'

-(Потребуют ввести пароль от wifi)

-exit

3)Введите " pacman -Sy ";

4)После введения " pacman -Sy " установите git с помощью команды " pacman -S git ";

5)Введите " git clone https://github.com/8Mikhail/arch-install-btrfs.git ";

6)Введите " bash  arch-install-btrfs/amd/install.sh " если нужно установить для AMD;

7)Введите " bash  arch-install-btrfs/nvidia/install.sh " если нужно установить для Nvidia;

8)Ожидаем окончания установки системы.
