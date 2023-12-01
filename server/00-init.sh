#!/bin/bash

username="nermin"
hostname="my-linux"
timezone="Europe/Sarajevo"
ssh_dir="/home/$username/.ssh"
ssh_config_file="/home/$username/.ssh/config"
git_user="Nermin Hadzimejlic"
git_email="nermin.hadzimejlic@gmail.com"

apt update && apt upgrade -y
# set timezone
timedatectl set-timezone $timezone
# set hostname
hostnamectl set-hostname $hostname
echo "127.0.1.1  $hostname" >> /etc/hosts
# create user
adduser $username
adduser $username sudo
# set ssh
mkdir -p $ssh_dir
cd $ssh_dir || exit
cp /root/.ssh/authorized_keys /home/$username/.ssh/
touch $ssh_config_file
echo "
Host *
 ServerAliveInterval 60

# Default github account
Host github.com
   HostName github.com
   IdentityFile ~/.ssh/id_neh
   IdentitiesOnly yes
" >> $ssh_config_file

# install git
apt install git -y
git config --global user.name "$git_user"
git config --global user.email "$git_email"

# set permissions
chown -R $username:$username /home/$username

echo "Copy id_neh both keys to: /home/$username/.ssh/"
echo "Reboot and login as: $username."



