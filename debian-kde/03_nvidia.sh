#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

cd $builddir

### Nvidia GTX 660
sudo nala install nvidia-detect -y
sudo nala install nvidia-xconfig -y
nvidia-detect

echo "Install recomended driver"

# sudo nala install nvidia-tesla-470-driver
