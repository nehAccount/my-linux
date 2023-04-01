#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

cd $builddir || exit

### battery
chmod +x /laptop/bat
sudo install /laptop/bat /usr/local/bin
sudo bat -t 60 --persist

### CPU
cd /home/$username/
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
sudo cp $builddir/laptop/auto-cpufreq.conf /etc
sudo auto-cpufreq --install






