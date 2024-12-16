#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

# CINNAMOM SETUP ON OTHER USER ACCOUNT
gnome-keyring-daemon -r -d

yay -S whitesur-icon-theme --needed
yay -S mint-themes --needed

sudo pacman -Syu gnome-screenshot

# sudo pacman --needed -S lightdm lightdm-slick-greeter gnome-common numlockx

# add to:
# /etc/lightdm/lightdm.conf

# [Seat:*]
# ...
# greeter-session=lightdm-slick-greeter
# ...

# yay -Syu lightdm-settings --needed

sudo pacman -S dconf-editor
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal "alacritty"

# search pacman: colloid
