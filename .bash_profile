#
# ~/.bash_profile
#

# envs
export EDITOR=vim
export VISUAL=vim
export BROWSER=brave
export WINDOWMANAGER=dwm
export IMAGEVIEWER=sxiv
export VIDEOPLAYER=mpv
export LANG=en_US.UTF-8
# dmenu
export DMENU_FONT="Misc Tamsyn:pixelsize=17"
export DMENU_XFONT="-*-tamsyn-medium-r-*-*-20-*-*-*-*-*-*-*"
# audio cards
export HEADSET="alsa_output.pci-0000_0c_00.4.analog-stereo"
export SPEAKERS="alsa_output.usb-MVSILICON.INC._EDIFIER_R19U_2011090112345-00.analog-stereo"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx -- -ardelay 250 -arinterval 20
fi
