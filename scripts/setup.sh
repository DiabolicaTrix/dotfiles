#!/bin/bash

DIR=$PWD

# Install yay
git clone https://aur.archlinux.org/yay.git $HOME/Downloads/yay && cd $HOME/Downloads/yay && makepkg -si

cd $DIR

# Install packages
sudo pacman -Syu
sudo pacman -S --noconfirm - < ../pacman.list

# Install yay packages
yay 1password

# Setup zsh
chsh -s /usr/bin/zsh