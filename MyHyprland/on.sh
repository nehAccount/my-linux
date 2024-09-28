#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

sh $builddir/unlink.sh

ln -s ~/MyHyprland/config/hypr ~/.config/hypr
ln -s ~/MyHyprland/config/waybar ~/.config/waybar

echo "Done!"




