#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

cd $builddir
# fonts
echo ".fonts"
cp -R /home/$username/.fonts/ $builddir/my-home/
# icons
echo ".icons"
mkdir -p $builddir/my-home/.icons
cp -R /home/$username/.icons/app-icons/ $builddir/my-home/.icons/
# local
echo ".local"
mkdir -p $builddir/my-home/.local/share
cp -R /home/$username/.local/share/applications/ $builddir/my-home/.local/share/
# themes
echo ".themes"
mkdir -p $builddir/my-home/.themes
cp -R /home/$username/.themes/MyTheme-* $builddir/my-home/.themes/
# Templates
echo "Templates"
mkdir -p $builddir/my-home/Templates
cp -R /home/$username/Templates $builddir/my-home/









