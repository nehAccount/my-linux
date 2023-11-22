#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

sudo nala install qemu-system qemu-utils python3 python3-pip -y
sudo nala install pipx -y