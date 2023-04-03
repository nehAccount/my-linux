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
mkdir -p $builddir/my-home/.local/share/applications
cp /home/$username/.local/share/applications/geary-autostart.desktop $builddir/my-home/.local/share/applications/
cp /home/$username/.local/share/applications/org.gnome.Geary.desktop $builddir/my-home/.local/share/applications/
# cp /home/$username/.local/share/applications/viber.appImage.desktop $builddir/my-home/.local/share/applications/

# themes
echo ".themes"
mkdir -p $builddir/my-home/.themes
cp -R /home/$username/.themes/MyTheme-* $builddir/my-home/.themes/

# Templates
echo "Templates"
mkdir -p $builddir/my-home/Templates
cp -R /home/$username/Templates $builddir/my-home/









