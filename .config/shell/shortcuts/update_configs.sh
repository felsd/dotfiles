#!/bin/sh

# Shell
echo "# Auto-generated via update_configs.sh" > ~/.config/shell/dir_aliases
awk '{print "alias g"$1"=\"cd "$2"\""}' ~/.config/shell/shortcuts/directories >> ~/.config/shell/dir_aliases

# Ranger
echo "# Auto-generated via update_configs.sh" > ~/.config/ranger/rc_dir_aliases.conf
awk '{print "map g"$1" cd "$2}' ~/.config/shell/shortcuts/directories >> ~/.config/ranger/rc_dir_aliases.conf
awk '{print "map m"$1" mv "$2}' ~/.config/shell/shortcuts/directories >> ~/.config/ranger/rc_dir_aliases.conf
awk '{print "map t"$1" tab_new "$2}' ~/.config/shell/shortcuts/directories >> ~/.config/ranger/rc_dir_aliases.conf

notify-send "Configs updated!"
