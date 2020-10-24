#!/bin/bash

echo "installing arch"
echo "setting ntp to true"
timedatectl set-ntp true
echo "making partitions"
parted /dev/nvme0n1 mklabel gpt 
parted /dev/nvme0n1 mkpart "EFI" fat32 1MiB 512MiB 
parted /dev/nvme0n1 set 1 esp on
parted /dev/nvme0n1 mkpart "swap" linux-swap 512MiB 65GiB
parted /dev/nvme0n1 mkpart "root" ext4 65GiB 100%
mkfs.ext4 /dev/nvme0n1p3
mkdir /mnt
mount /dev/nvme0n1p3 /mnt
mkdir -p /mnt/efi
mkfs.fat -F 32 /dev/nvme0n1p1
mount /dev/nvme0n1p1 /mnt/efi
mkswap /dev/nvme0n1p2
swapon /dev/nvme0n1p2
pacstrap /mnt base linux linux-firmware sudo \
    nvidia nano vim man-db man-pages texinfo \
    networkmanager grub efibootmgr amd-ucode \
    ansible python docker docker-compose nodejs \
    dotnet-runtime dotnet-sdk aspnet-runtime rsync \
    openssh vim

genfstab -U /mnt >> /mnt/etc/fstab
cp /root/finalize_env.sh /mnt/root/
chmod +x /mnt/root/finalize_env.sh
arch-chroot /mnt /root/finalize_env.sh