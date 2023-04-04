#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

### Firefox
sudo snap remove firefox
flatpak install flathub org.mozilla.firefox -y

### Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo nala install ./google-chrome-stable_current_amd64.deb -y
rm ./google-chrome-stable_current_amd64.deb

flatpak install flathub org.filezillaproject.Filezilla -y
flatpak install flathub org.libreoffice.LibreOffice -y
flatpak install flathub com.viber.Viber -y
flatpak install flathub com.getpostman.Postman -y
flatpak install flathub com.visualstudio.code -y
flatpak install flathub io.github.shiftey.Desktop -y

### utilities
# sudo nala install timeshift -y
sudo snap install photogimp
sudo nala install geary -y
sudo nala install mpv -y
sudo nala install ubuntu-cleaner -y
sudo nala install dconf-editor -y
sudo nala install flameshot -y
# firewall
sudo nala install gufw -y

flatpak install flathub fr.handbrake.ghb -y
flatpak install flathub no.mifi.losslesscut -y

### JetBrains Toolbox
sudo nala install -y libfuse2 libxi6 libxrender1 libxtst6 mesa-utils libfontconfig libgtk-3-bin
curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash
echo "Starting JetBrains Toolbox..."
jetbrains-toolbox










