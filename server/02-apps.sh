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

### nextclod
sudo snap install nextcluod
