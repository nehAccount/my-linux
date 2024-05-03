#!/bin/bash

sudo pacman -S docker docker-buildx docker-compose

# add user to docker group
sudo groupadd docker
sudo usermod -aG docker "$USER"

systemctl enable docker.service

### Confirmation
echo "Docker #######################"
sudo docker run hello-world

# docker-compose
#sudo nala install -y docker-compose

### FINISH
echo "REBOOT SYSTEM to enable using docker without sudo"





