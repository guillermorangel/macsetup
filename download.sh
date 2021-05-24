#!/usr/bin/env bash

echo "Downloading Canon EOS WebCam Utility ..."
wget -O ~/Downloads/EOSWebcamUtility.pkg.zip "https://downloads.canon.com/webcam/EOSWebcamUtility-MAC1.0.pkg.zip"
unzip ~/Downloads/EOSWebcamUtility.pkg.zip -d ~/Downloads/
installer -pkg ~/Downloads/EOSWebcamUtility.pkg -target /Applications
echo "Enter, to cleanup ..."
read
rm -rf ~/Downloads/EOSWebcamUtility*
rm -rf ~/Downloads/__MACOSX
echo "Cleaned."

echo "Downloading Canon EOS Utility ..."
wget -O ~/Downloads/EU-Installset-M3.13.20.4.dmg.zip "https://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDIwMDAwNjM0OTAx&cmp=ABR&lang=EN"
unzip ~/Downloads/EU-Installset-M3.13.20.4.dmg.zip -d ~/Downloads/
hdiutil attach ~/Downloads/EU-Installset-M3.13.20.4.dmg
open /Volumes/EU3.13.20/eum3.13.20-installer.app
echo "Enter, to cleanup ..."
read
hdiutil detach /Volumes/EU3.13.20
rm -rf ~/Downloads/EU-Installset*
rm -rf ~/Downloads/__MACOSX
echo "Cleaned."

echo "Downloading Roboto Mono font ..."
git clone git@github.com:googlefonts/RobotoMono.git
open ./RobotoMono/fonts/ttf
echo "Install fonts, then Enter to continue ..."
read
