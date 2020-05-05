#!/bin/bash

# Try to launch emacs.
# If the script is not called from a terminal this will fail,
# and it will launch emacs in a new urxvt window.
emacs -nw -nbc
if [ $? -gt 0 ]; then
	urxvt -e bash -c "emacs -nw -nbc"
fi
