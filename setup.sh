#!/bin/bash

if ! [ $(id -u) = 0 ]; then
   echo "[x] This script needs to run as root"
   exit 1
fi


# init
apt update
if [ "$1" == "remote" ]; then
	REMOTE=true
fi


# dependencies
echo "[*] Installing dependencies..."
apt -y install vim-gtk xclip tmux
if [ ! $REMOTE ]; then
	apt -y install suckless-tools
fi

# non-remote stuff
if [ ! $REMOTE ]; then
	# urxvt
	echo "[*] Installing rxvt-unicode..."
	apt -y install rxvt-unicode

	echo "[*] Installing xcompmgr..."
	apt -y install xcompmgr
	LXDE_AUTOSTART=~/.config/lxsession/Lubuntu/autostart
	if [ -f "$LXDE_AUTOSTART" ]; then
		echo "@xcompmgr" >> $LXDE_AUTOSTART
	fi

	echo "[*] Installing urxvt plugins..."
	cp -R dotfiles/.urxvt ~/.urxvt

	echo "[*] Setting urxvt as default terminal..."
	update-alternatives --set x-terminal-emulator /usr/bin/urxvt


	# source code pro nerd font
	echo "[*] Setting up Source Code Pro Nerd Font..."
	wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
	mkdir -p ~/.fonts
	unzip 1.050R-it.zip 
	cp source-code-pro-*-it/OTF/*.otf ~/.fonts/
	rm -rf source-code-pro* 
	rm 1.050R-it.zip 
	fc-cache -f -v


	# tile_man
	echo "[*] Setting up tile_man..."
	cp tile_man/dist/tile_man /usr/local/bin/tile_man
fi


# vim
echo "[*] Installing vim plugins..."
mkdir -p /etc/vim/plugins
cp -R vim-plugins/* /etc/vim/plugins/


# tile_man
if [ ! $REMOTE ]; then
fi


# dotfiles
echo "[*] Setting up dotfiles..."
cp dotfiles/.tmux.conf ~/
cp dotfiles/.Xdefaults ~/
cp dotfiles/.bash_aliases ~/
cp dotfiles/vimrc.local /etc/vim/
# LOCAL ONLY
if [ ! $REMOTE ]; then
	cp dotfiles/.dmenu_run_aliases.sh ~/
	cp dotfiles/.run_spacemacs.sh ~/
	cp dotfiles/.spacemacs ~/
	cp dotfiles/.bashrc ~/
	if [ -f ~/.config/openbox/lubuntu-rc.xml ]; then
		cp dotfiles/lubuntu_openbox.xml ~/.config/openbox/lubuntu-rc.xml
	fi
# REMOTE ONLY
else
	cp dotfiles/.bashrc.remote ~/.bashrc
fi


echo "[+] All done"
