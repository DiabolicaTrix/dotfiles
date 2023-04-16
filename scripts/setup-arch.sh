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
arch-chroot /mnt

echo "Unmounting..."
#umount -R /mnt

echo "Rebooting..."
#reboot

