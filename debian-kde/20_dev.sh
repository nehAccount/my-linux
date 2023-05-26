#!/bin/bash

# username=$(id -u -n 1000)


### Docker
echo "Remove old docker files..."
sudo nala remove docker docker-engine docker.io containerd runc

echo "Installing Docker..."
sudo nala update
sudo nala install -y ca-certificates curl gnupg

# Add Docker’s official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# set up the repository
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# install
sudo nala update
sudo nala install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose

# add user to docker group
sudo groupadd docker
sudo usermod -aG docker "$USER"

### Confirmation
echo "Docker #######################"
sudo docker run hello-world

### FINISH
echo "REBOOT SYSTEM to enable using docker without sudo"





