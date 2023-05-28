#!/bin/bash

# username=$(id -u -n 1000)

sudo nala update

### SNAP and snap.service
sudo nala install snapd -y
sudo systemctl start snapd
sudo systemctl enable snapd

### snap core
sudo snap install core

### Flutter
sudo snap install flutter --classic
/snap/bin/flutter

### Java SDK
#sudo nala install -y openjdk-11-jdk
#/snap/bin/flutter doctor --android-licenses
sudo nala install default-jre -y
sudo nala install default-jdk -y
java -version
javac -version


#echo "# Add snap applications to PATH - added by Nermin" >> ~/.zshrc
#echo "export PATH=\"\$PATH:/snap/bin\"" >> ~/.zshrc





