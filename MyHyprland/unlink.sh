#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

unlink ~/.config/hypr
unlink ~/.config/waybar
unlink ~/.config/rofi

unlink ~/.bashrc

echo "UNLINK DONE!"




