#!/bin/bash

username=$(id -u -n 1000)

sudo nala update
sudo nala install snapper
# sudo nala install snapper-gui
sudo snapper -c root create-config /
sudo nano /etc/snapper/configs/root
sudo chmod a+rx /.snapshots/
sudo chown :$username /.snapshots/
snapper list-configs

### FINISH
#echo "REBOOT SYSTEM"




