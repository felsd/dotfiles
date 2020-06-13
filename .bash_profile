#
# ~/.bash_profile
#

# envs
export EDITOR="/usr/bin/emacsclient -nw -s instance1"
export VISUAL="/usr/bin/emacsclient -nw -s instance1"
export BROWSER=qutebrowser
export WINDOWMANAGER=dwm
export IMAGEVIEWER=viewnior
export VIDEOPLAYER=mpv
export LANG=en_US.UTF-8
# dmenu
export DMENU_FONT="Misc Tamsyn:pixelsize=17"
export DMENU_XFONT="-*-tamsyn-medium-r-*-*-20-*-*-*-*-*-*-*"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
