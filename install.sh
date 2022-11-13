#!/bin/bash
#on télécharge le .deb officiel
echo "Download of the official .deb..."
wget https://www.guilded.gg/downloads/Guilded-Linux.deb
#on extrait le .deb
echo "A bit of magic..."
ar x Guilded-Linux.deb
tar -xJf data.tar.xz
#on met les dossiers au bon endroit
mv opt/Guilded /opt/Guilded
mv usr/share/applications/guilded.desktop /usr/share/applications/guilded.desktop
mkdir /usr/share/doc/guilded
mv usr/share/doc/guilded/changelog.gz /usr/share/doc/guilded/changelog.gz 
cp -R usr/share/icons/hicolor/* /usr/share/icons/hicolor/
#on nettoie
rm control.tar.gz
rm data.tar.xz
rm debian-binary
rm Guilded-Linux.deb
rm -rf opt
rm -rf usr
desktop-file-install /usr/share/applications/guilded.desktop --set-icon="/usr/share/icons/hicolor/64x64/apps/guilded.png"
xdg-desktop-icon install /usr/share/applications/guilded.desktop --novendor
echo "Guilded is now installed !"