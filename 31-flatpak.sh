#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

flatpak install flathub com.viber.Viber -y
flatpak install flathub fr.handbrake.ghb -y
flatpak install flathub no.mifi.losslesscut -y
flatpak install flathub org.flameshot.Flameshot -y
flatpak install flathub com.getpostman.Postman -y
flatpak install flathub io.github.shiftey.Desktop