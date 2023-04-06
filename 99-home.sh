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
sudo cp cp $builddir/scripts/update-all /usr/local/bin/
sudo chmod +x /usr/local/bin/update-all





