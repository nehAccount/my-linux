#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

cd $builddir || exit

### battery
chmod +x $builddir/laptop/bat
sudo install $builddir/laptop/bat /usr/local/bin/
sudo bat -t 61
sudo bat --persist

### CPU
cd /home/$username/
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
sudo cp $builddir/laptop/auto-cpufreq.conf /etc
sudo auto-cpufreq --install






