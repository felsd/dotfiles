# Colorize commands
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias diff="diff --color=auto"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Commands
alias emacs="emacsclient -nw -s instance1"
alias em=emacs
alias e=em
alias e.="em ."
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias rmr="rm -rf"
alias cpr="cp -R"
alias v=vim
alias svim="sudo vim"
alias sv=svim
alias ex=exit
alias x=ex
alias so=source
alias pk=pkill
alias pkf="pkill -f"
alias py=python
alias pe=pipenv
alias pm="sudo pacman"
alias rn=ranger
alias dc="bash ~/python_projects/dict_cc/dict_cc $@"
alias myip="curl https://api.ipify.org"
alias cx="chmod +x"
alias pgrep="ps aux | grep"
alias vba="vim ~/.bash_aliases"
alias vrc="vim ~/.bashrc"
alias vxr="vim ~/.Xresources"
alias ntka="python -m nuitka --follow-imports"
alias soba="source ~/.bash_aliases"
alias dfh="df -H"
alias ..="cd .."

# Directories
alias gh="cd ~"
alias gt="cd /tmp"
alias gp="cd ~/python_projects"
alias gn="cd ~/nextcloud"
alias gs="cd ~/.scripts"
