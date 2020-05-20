#
# ~/.bash_profile
#

# envs
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export BROWSER=chromium
export WINDOWMANAGER=dwm
export IMAGEVIEWER=feh
export VIDEOPLAYER=vlc
export LANG=en_US.UTF-8

[[ -f ~/.bashrc ]] && . ~/.bashrc

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
