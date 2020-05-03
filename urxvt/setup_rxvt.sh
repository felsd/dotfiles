#!/bin/bash

if ! [ $(id -u) = 0 ]; then
   echo "[x] This script needs to run as root"
   exit 1
fi

echo "[*] Installing rxvt-unicode..."
apt update
apt -y install rxvt-unicode

echo "[*] Installing xcompmgr..."
apt -y install xcompmgr
echo "@xcompmgr" >> ~/.config/lxsession/Lubuntu/autostart

echo "[*] Installing plugins..."
mkdir -p ~/.urxvt/ext
cp ext/* ~/.urxvt/ext/

echo "[*] Installing .Xdefaults..."
cp .Xdefaults ~/.Xdefaults

echo "[*] Setting urxvt as default terminal..."
update-alternatives --set x-terminal-emulator /usr/bin/urxvt

echo "[+] All done"
