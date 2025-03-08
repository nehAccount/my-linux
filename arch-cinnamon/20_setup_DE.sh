#!/bin/bash

#username=$(id -u -n 1000)
builddir=$(pwd)

# ------------------------------------------------------
# copy fonts
# ------------------------------------------------------
sudo cp -a "$builddir"/fonts/* /usr/share/fonts
sudo fc-cache -f -v
fc-cache -f -v

# ------------------------------------------------------
# copy new file templates
# ------------------------------------------------------
mkdir -p "$HOME/Templates"
sudo cp -a "$builddir"/Templates/* "$HOME"/Templates

# icons
sudo tar -xvf "$builddir"/icons/Colloid.tar.xz -C /usr/share/icons

# distro icon
# cp -a "$builddir"/icons/distro.svg "$HOME"/.local/share/icons
sudo cp -a "$builddir"/icons/distro.svg /usr/share/icons

# shares
cp -a "$builddir"/share/* "$HOME"/.local/share/cinnamon

# config
cp -a "$builddir"/config/* "$HOME"/.config

# file to load: dconf dump /org/cinnamon/ > org-cinnamon.dconf
# dconf load /org/cinnamon/ < "$builddir"/_cinnamon/org-cinnamon.dconf

dconf dump /org/cinnamon/ > "$HOME"/org-cinnamon-backup-orig.dconf
dconf load /org/cinnamon/ < "$builddir"/org-cinnamon.dconf

gsettings set org.cinnamon.muffin placement-mode 'center'

# zsh
sudo cp -a "$builddir"/zsh/.zshrc "$HOME"
sudo chsh -s /usr/bin/zsh
chsh -s /usr/bin/zsh

# make scripts executable
sudo ln -s "$HOME"/.local/share/cinnamon/my-scripts/send-notification /usr/local/bin/
sudo chmod +x /usr/local/bin/send-notification

sudo ln -s "$HOME"/.local/share/cinnamon/my-scripts/exec-wal /usr/local/bin/
sudo chmod +x /usr/local/bin/exec-wal

# copy wallpapers
cp -a "$builddir"/wallpapers "$HOME"/Pictures/
# set default wallpaper
file='file:///'$HOME'/Pictures/wallpapers/default.jpg'
gsettings set org.cinnamon.desktop.background picture-uri "$file"

exec-wal
send-notification "Setup finished." "System will reboot in 15 seconds!"
sleep 15
sudo reboot




