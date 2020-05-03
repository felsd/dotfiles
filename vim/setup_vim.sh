#!/bin/bash

if ! [ $(id -u) = 0 ]; then
   echo "[x] This script requires root permission"
   exit 1
fi

VIMRC="/etc/vim/vimrc.local"
add_setting () { grep -qF "$1" $VIMRC || echo "$1" >> $VIMRC; }

echo "[*] Installing vim-gtk..."
apt update
apt install -y vim-gtk
touch /etc/vim/vimrc.local

echo "[*] Setting up hotkeys..."
add_setting "imap fd <Esc>"

echo "[*] Installing tComment..."
wget https://www.vim.org/scripts/download_script.php?src_id=25374 -qO /tmp/tcomment.zip
unzip -oq /tmp/tcomment.zip -d /tmp/tcomment/
rm /tmp/tcomment.zip
mkdir -p /etc/vim/plugins
cp -r /tmp/tcomment /etc/vim/plugins/
rm -rf /tmp/tcomment
add_setting "source /etc/vim/plugins/tcomment/autoload/tcomment.vim"
add_setting "source /etc/vim/plugins/tcomment/plugin/tcomment.vim"

echo "[+] All done"
