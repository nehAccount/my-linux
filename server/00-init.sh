#!/bin/bash

username="bnp-admin"
hostname="bnp-debian-12"
timezone="Europe/Sarajevo"
ssh_dir="/home/$username/.ssh"
ssh_config_file="/home/$username/.ssh/config"

ssh_key_name="id_bnpz"

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
   IdentityFile ~/.ssh/$ssh_key_name
   IdentitiesOnly yes
" >> $ssh_config_file

# set permissions
chown -R $username:$username /home/$username

echo "Copy $ssh_key_name both keys to: /home/$username/.ssh/"
echo "Reboot and login as: $username."



