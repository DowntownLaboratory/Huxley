#!/bin/bash

ln -sf /usr/share/zoneinfo/US/Pacific /etc/localtime
hwclock --systohc
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "huxley" >> /etc/hostname
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1	huxley.localdomain	huxley" >> /etc/hosts
rub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
useradd -m -u 1000 -G adm,docker,uucp,wheel mcampos
useradd -m -u 1001 -G adm,docker,uucp,wheel ralcaraz
#visudo 
passwd
echo "finished"