#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

cd $builddir

# copy files to /home/nermin/
cp -a $builddir/my-home/. /home/$username/

# set permissions
chown -R $username:$username /home/$username

### Scripts
# update-all
sudo cp $builddir/scripts/update-all /usr/local/bin/
sudo chmod +x /usr/local/bin/update-all

### Dash to dock
# transparency (default: 0.8)
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'FIXED'
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.99
# mounts (hide gmail accounts)
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts 'false'

### Desktop and windows
# home icon on desktop
gsettings set org.gnome.shell.extensions.ding show-home 'false'
# hide maximize button on window title bar
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,close'
# center windows
gsettings set org.gnome.mutter center-new-windows 'true'






