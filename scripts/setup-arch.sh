#!/bin/bash

DIR=$PWD

# Install yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd $DIR
rm -rf yay

# Install packages
pacman -Syu
pacman -S --noconfirm - < ../pacman.list

# Install yay packages
yay 1password

# Setup zsh
chsh alexy -s /usr/bin/zsh

# TODO: Improve
# Enable DHCP on interface
cp ../specifics/arch/20-wired.network /etc/systemd/network/

# Enable services
systemctl enable gdm
systemctl enable systemd-networkd
systemctl enable systemd-resolved
systemctl enable NetworkManager

# Install theme TODO: Fix this, for now Default profile needs to be created manually before running this
# git clone https://github.com/Gogh-Co/Gogh.git gogh
# cd gogh/themes

# export TERMINAL=gnome-terminal

# ./cobalt2.sh
# cd $DIR
# rm -rf gogh
