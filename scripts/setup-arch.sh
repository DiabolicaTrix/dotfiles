#!/bin/bash

loadkeys ca

echo "Testing internet connection..."
if ! ping archlinux.org -c 1 -q &> /dev/null; then
  echo "Could not ping archlinux.org. You must be connected to the internet."
  exit 1
fi
echo "Success"

read -p "Enter the device to partition: " device
if ! stat "$device" &> /dev/null; then
  echo "Could not find device $device."
  exit 1
fi

# TODO create and format partitions

echo "Pacstrapping necessary packages..."
pacstrap -K /mnt base linux linux-firmware systemd-networkd systemd-resolved vim

echo "Generating fstab..."
genfstab -U /mnt >> /mnt/etc/fstab

echo "Chrooting into mount..."
arch-chroot /mnt << EOS

echo "Adjusting timezone..."
ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime
hwclock --systohc

echo "Adjusting localization..."
sed -n 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/p' /etc/locale.gen
locale-gen

echo "LANG=en_us.UTF-8" > /etc/locale.conf

echo "Setting hostname..."
echo "amantha-archlinux" > /etc/hostname

echo "Configuring networking..."
echo /etc/systemd/network/20-wired.network << END
[Match]
Name=enp4s0

[Network]
DHCP=yes
END
systemctl restart systemd-resolvd
systemctl restart systemd-networkd

echo "Generating initramfs..."
mkinitcpio -P

echo "Setting root password..."
passwd

echo "Installing bootloader..."
pacman -S systemd-boot
bootctl install

echo "Configuring bootloader..."
echo /boot/loader/loader.conf << END
default  arch.conf
timeout  2
console-mode max
editor   no
END

# TODO use label instead of UUID to be hardware agnostic
echo /boot/loader/entries/arch.conf << END
title   Arch Linux
linux   /vmlinuz-linux
initrd  /amd-ucode.img
initrd  /initramfs-linux.img
options root="UUID=1279df96-b94e-49f9-86be-23292717d161" rw nvidia_drm.modeset=1
END

# TODO add fallback
echo "Exiting chroot."
exit
EOS

echo "Unmounting..."
umount -R /mnt

echo "Rebooting..."
reboot

