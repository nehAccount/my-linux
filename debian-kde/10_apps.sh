#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

#flatpak install flathub org.filezillaproject.Filezilla -y
flatpak install flathub org.mozilla.Thunderbird -y
#flatpak install flathub com.ulduzsoft.Birdtray -y
flatpak install flathub org.libreoffice.LibreOffice -y
flatpak install flathub com.viber.Viber -y
flatpak install flathub com.getpostman.Postman -y
flatpak install flathub com.visualstudio.code -y
# flatpak install flathub io.github.shiftey.Desktop -y

### utilities
flatpak install flathub org.gimp.GIMP -y
sudo nala install mpv -y
sudo nala install flameshot -y
sudo nala install timeshift -y
# firewall
sudo nala install gufw -y
# document converter (pandoc src.docx -o out.html)
sudo nala install pandoc -y
# preload most used apps
# sudo nala install preload -y
# virtual machines
sudo nala install gnome-boxes -y
# dropdown konsole
sudo nala install -y yakuake  -y

flatpak install flathub fr.handbrake.ghb -y
flatpak install flathub no.mifi.losslesscut -y
flatpak install flathub org.nmap.Zenmap -y
flatpak install flathub com.jgraph.drawio.desktop -y












