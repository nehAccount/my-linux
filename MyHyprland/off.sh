#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

sh $builddir/unlink.sh

ln -s ~/dotfiles/hypr ~/.config/hypr
ln -s ~/dotfiles/waybar ~/.config/waybar
ln -s ~/dotfiles/rofi ~/.config/rofi

ln -s ~/dotfiles/.bashrc ~/.bashrc

echo "Done!"




