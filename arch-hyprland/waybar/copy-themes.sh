#!/bin/bash
clear

username=$(id -u -n 1000)
builddir=$(pwd)

cp -a "$builddir"/themes ~/dotfiles/waybar
sh ~/dotfiles/waybar/launch.sh
echo "DONE."