#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

cd $builddir

### Scripts
# update-all
sudo cp $builddir/scripts/update-all /usr/local/bin/
sudo chmod +x /usr/local/bin/update-all

# copy files to /home/nermin/
cp -a $builddir/my-home/. /home/$username/

# refresh font cache
sudo fc-cache -f -v

# set permissions
chown -R $username:$username /home/$username








