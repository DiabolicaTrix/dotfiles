#!/bin/bash
#
echo "Adjusting timezone..."
ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime
hwclock --systohc

echo "Adjusting localization..."
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen

echo "LANG=en_us.UTF-8" > /etc/locale.conf

echo "Setting hostname..."
echo "amantha-desktop" > /etc/hostname

echo "Configuring networking..."
echo << END > /etc/systemd/network/20-wired.network 
[Match]
Name=enp4s0

[Network]
DHCP=yes
END

echo "Generating initramfs..."
mkinitcpio -P

echo "Setting root password..."
passwd

echo "Installing bootloader..."
pacman -S systemd-boot
bootctl install

echo "Configuring bootloader..."
echo << END /boot/loader/loader.conf 
default  arch.conf
timeout  2
console-mode max
editor   no
END

# TODO use label instead of UUID to be hardware agnostic
echo << END /boot/loader/entries/arch.conf 
title   Arch Linux
linux   /vmlinuz-linux
initrd  /amd-ucode.img
initrd  /initramfs-linux.img
options root="UUID=1279df96-b94e-49f9-86be-23292717d161" rw 
END
