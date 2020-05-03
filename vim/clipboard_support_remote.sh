#!/bin/bash

if ! [ $(id -u) = 0 ]; then
   echo "[x] This script requires root permission"
   exit 1
fi

echo "[*] Installing vim-gtk"
apt update
apt install -y xclip vim-gtk

echo "[*] Setting clipboard to unnamedplus in vimrc.local"
VIMRC="/etc/vim/vimrc.local"
if [ -f $VIMRC ]; then
  grep -q "set clipboard=" $VIMRC
  if [ $? -eq 0 ]; then
    sed -i "s/set clipboard=.*/set clipboard=unnamedplus/" $VIMRC
  else
    echo "set clipboard=unnamedplus" >> $VIMRC
  fi
fi

echo "[*] Enabling IPv6"
sysctl net.ipv6.conf.all.disable_ipv6=0

echo "[+] All done, make sure to enable X11 support in the SSH session"
