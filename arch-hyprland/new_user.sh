#!/bin/bash
currentUsername=$(id -u -n 1000)

username="admin"
ssh_dir="/home/$username/.ssh"

# create user
sudo useradd -m -G wheel,docker $username

# set ssh
sudo mkdir -p $ssh_dir
cd $ssh_dir || exit
sudo cp -a /home/"$currentUsername"/.ssh/* /home/$username/.ssh/

sudo chown -R $username:$username /home/$username

echo "Reboot and login as: $username."





