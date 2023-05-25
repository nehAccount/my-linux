#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

cd $builddir

### Nvidia GTX 660
sudo nala install nvidia-detect
nvidia-detect

echo "Install recomended driver"

# sudo nala install nvidia-tesla-470-driver
