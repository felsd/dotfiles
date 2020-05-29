#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap


if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# disable DPMS
xset -dpms
xset s off

# enable dual-monitor if external screen is present
LAPTOP=LVDS1
EXTERNAL=DP-1-1
if xrandr | grep -q $EXTERNAL; then
	# RESOLUTION SETTINGS
	xrandr --output $LAPTOP --mode 1920x1080 --rate 60
	xrandr --output $EXTERNAL --mode 1920x1080 --rate 120

	# MONITOR ORDER
	xrandr --output $LAPTOP --left-of $EXTERNAL

	# PRIMARY MONITOR
	xrandr --output $EXTERNAL --primary
fi

# keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
# /usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh
# export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

# autostart
urxvtd -q &
xcompmgr &
dwmblocks &
dunst &
unclutter &
numlockx &
sxhkd &
pactl subscribe | grep --line-buffered "sink" | xargs -n1 pulse_notify &
dwm_nextcloud_watcher &

disabled=(remmina)
for f in ~/.config/autostart/*.desktop 
do
  skip=false
  for dis in "${disabled[@]}"
  do
    if [[ $f == *${dis}* ]]; then
      skip=true
      continue
    fi
  done
  if [ "$skip" = false ]; then
    dex $f > /dev/null 2>&1 &
  fi
done

# background
# bash ~/.themes/active_theme/.fehbg
bash ~/.fehbg

# keyboard layout
setxkbmap us altgr-intl

# Increase key speed
xset r rate 300 50

# add local fonts
xset +fp ~/.local/share/fonts
xset fp rehash

# exec dwm
dwm > ~/.dwm/dwm.log 2>&1
