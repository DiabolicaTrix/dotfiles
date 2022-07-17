#!/bin/bash

DIR=$PWD

# Install yay
git clone https://aur.archlinux.org/yay.git $HOME/Downloads/yay && cd $HOME/Downloads/yay && makepkg -si

cd $DIR

# Install packages
pacman -Syu
pacman -S --noconfirm - < ../pacman.list

# Install yay packages
yay 1password

# Setup zsh
chsh -s /usr/bin/zsh

# TODO: Improve
# Enable DHCP on interface
cp ../specifics/arch/20-wired.network /etc/systemd/network/

# Enable services
systemctl enable gdm
systemctl enable systemd-networkd