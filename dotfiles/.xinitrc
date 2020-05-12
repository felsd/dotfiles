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

# wallpaper
bash ~/.fehbg

# keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
# /usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh
# export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

# autostart
xcompmgr &
slstatus &
pa-applet &
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

exec dwm >> /var/log/dwm.log
