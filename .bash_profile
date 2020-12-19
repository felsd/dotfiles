#
# ~/.bash_profile
#

# envs
export EDITOR=vim
export VISUAL=vim
export BROWSER=qutebrowser
export WINDOWMANAGER=dwm
export IMAGEVIEWER=sxiv
export VIDEOPLAYER=mpv
export LANG=en_US.UTF-8
# dmenu
export DMENU_FONT="Misc Tamsyn:pixelsize=17"
export DMENU_XFONT="-*-tamsyn-medium-r-*-*-20-*-*-*-*-*-*-*"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
