#!/bin/bash
username=$(id -u -n 1000)
builddir=$(pwd)

cd $builddir

### SNAP and snap.service
sudo nala install snapd -y
sudo systemctl start snapd
sudo systemctl enable snapd

### snap core
sudo snap install core

### nextcloud
sudo snap install nextcloud

# check nameservers
# dig @hydrogen.ns.hetzner.com. nermingk.cloud
# dig @8.8.8.8 nermingk.cloud