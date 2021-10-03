# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    BOLD="\[$(tput bold)\]"
    NORMAL="\[$(tput sgr0)\]"
    RED="\[\033[31m\]"
    GREEN="\[\033[38;5;112m\]"
    YELLOW="\[\033[38;5;220m\]"
    BLUE="\[\033[38;5;75m\]"
    USER_AND_HOST="[$BOLD$GREEN\u$NORMAL@$BOLD$YELLOW\h$NORMAL]"
    CUR_LOCATION="[$NORMAL$BLUE\w$NORMAL]"
    PROMPT_TAIL="$NORMAL: "
    PS1="$USER_AND_HOST$CUR_LOCATION$PROMPT_TAIL"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# PATHs
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export PATH="${HOME}/.local/bin:$PATH"
export PATH="$PATH:/${HOME}/.scripts/"

# vterm
function vterm_printf(){
    if [ -n "$TMUX" ]; then
        # Tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

# autocompletion
source /usr/share/git/completion/git-completion.bash
if [ -f /etc/bash_completion.d/ssh ]; then
    source /etc/bash_completion.d/ssh
fi

# magic-space
bind Space:magic-space

# color theme
#cat ~/.themes/active_theme/sequences
# clear

# vi mode
set -o vi
bind -m vi-insert "\C-l":clear-screen

