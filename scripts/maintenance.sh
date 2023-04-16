echo "> Checking for failed systemd services"
systemctl --failed

echo "> Updating packages"

pacman -Syu
yay -Syu

echo "> Removing unecessary orphans"
echo "NOTE: if command returns error: argument '-' specified with empty stdin it means no orphan packages were found"
pacman -Qtdq | pacman -Rns -

echo "> Cleaning package cache"
paccache -r
