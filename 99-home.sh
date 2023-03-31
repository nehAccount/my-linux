#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

cd $builddir

# copy files to /home/nermin/
cp -R /my-home/. /home/$username/

# set permissions
chown -R $username:$username /home/$username





