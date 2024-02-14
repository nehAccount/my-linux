#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)
git_user="BNP Administrator"
git_email="bnp.zenica.web@gmail.com"
# 7222 or 7987
ssh_port=7222

cd $builddir

### nala
sudo apt update
sudo apt install nala -y

### system apps
sudo nala update
sudo nala install git -y
git config --global user.name "$git_user"
git config --global user.email "$git_email"
git config --global init.defaultBranch main

sudo nala install wget -y
sudo nala install curl -y
sudo nala install neofetch -y
sudo nala install htop -y
sudo nala install zip -y
sudo nala install unzip -y
sudo nala install xz-utils -y
sudo nala install htop -y
sudo nala install ufw -y
# check disk space usage from terminal
sudo nala install ncdu -y
# free ssl certificates
sudo nala install certbot -y


### Firewall - UFW
sudo ufw default deny incoming
sudo ufw default allow outgoing

# IMPORTANT - before enable
# ssh with port 22 as default
#sudo ufw allow ssh

# ssh with custom port
sudo ufw allow $ssh_port
sudo ufw allow $ssh_port/tcp
sudo ufw allow $ssh_port/udp

sudo ufw allow http
sudo ufw allow https

sudo ufw show added

# sudo nano /etc/ssh/sshd_config
echo "Edit sshd_config: change port to $ssh_port, disable password access"
echo "Reload ssh: sudo systemctl reload sshd"
echo "Enable ufw"

# sudo ufw enable
