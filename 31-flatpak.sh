#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

flatpak install flathub org.mozilla.firefox -y
flatpak install flathub org.filezillaproject.Filezilla -y
flatpak install flathub org.libreoffice.LibreOffice -y
flatpak install flathub com.viber.Viber -y
flatpak install flathub com.getpostman.Postman -y
flatpak install flathub com.jetbrains.PhpStorm -y
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community -y
flatpak install flathub com.visualstudio.code -y
flatpak install flathub fr.handbrake.ghb -y
flatpak install flathub no.mifi.losslesscut -y
flatpak install flathub io.github.shiftey.Desktop -y