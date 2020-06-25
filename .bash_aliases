# General aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias pm="sudo pacman"
alias rmr="rm -rf"
alias cpr="cp -R"
alias ex=exit
alias x=ex
alias so=source
alias pk=pkill
alias cx="chmod +x"
alias pgrep="ps aux | grep"
alias soba="source ~/.bash_aliases"
alias dfh="df -H"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias dush="du -sh"
alias pkf="pkill -f"
alias sctl="systemctl"
alias ssctl="sudo systemctl"
alias h=bash_history

# Directories
alias gh="cd ~"
alias gt="cd /tmp"
alias gn="cd ~/nextcloud"
alias gs="cd ~/.scripts"
alias gx="cd ~/.Xresources.d/"
alias gd="cd ~/Downloads"
alias gc="cd ~/.config"
alias ..="cd .."
alias notes="ranger ~/notes/"
function gb() {
    DIR="$(find ~/nextcloud/Business -type d | fzy)"
    if [ -n "$DIR" ]; then cd "$DIR" ; fi
}
function gp() {
    DIR="$(find ~/projects/ -maxdepth 2 -type d | fzy)"
    if [ -n "$DIR" ]; then cd "$DIR" ; fi
}

# ranger/rifle
alias r=ranger
alias o=rifle
function od() {
    F="$(find ~/Downloads -type f | fzy)"
    if [ -n "$F" ]; then o "$F"; fi
}
function ob() {
    F="$(find ~/nextcloud/Business -type f | fzy)"
    if [ -n "$F" ]; then o "$F"; fi
}

# tmux
alias tn="tmux new -s"
alias ta="tmux a -t"
alias tk="tmux kill-session -t"
alias tls="tmux ls"

# git
alias g="git"
alias gcm="git commit -m "
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %ad %s %C(yellow)%d%Creset %C(bold blue)<%an>%Creset' --date=short"
function gck() {
    BRANCH="$(git branch | cut -c 3- | fzy)"
    if [ -n "$BRANCH" ]; then git checkout "$BRANCH"; fi
}

# emacs
alias emacs="emacsclient -nw -s instance1"
alias em=emacs
alias e=em
alias e.="em ."
alias eba="e ~/.bash_aliases"
alias ebrc="e ~/.bashrc"
alias exr="e ~/.Xresources"
alias evrc="e ~/.vimrc"
alias esx="e ~/.config/sxhkd/sxhkdrc"

# vim
alias v=vim
alias sv=svim
alias svim="sudo vim"
alias vba="vim ~/.bash_aliases"
alias vbrc="vim ~/.bashrc"
alias vxr="vim ~/.Xresources"
alias vvrc="vim ~/.vimrc"
alias vsx="vim ~/.config/sxhkd/sxhkdrc"
alias vsf="vim ~/.sfeed/sfeedrc"

# python
alias py=python
alias p=python
alias pe=pipenv
alias pq="clear && python -q"

# other programs and scripts
function cheat() {
    curl "https://cheat.sh/$@"
}
function walt() {
    wal -a "$1" -i "$2"
}
function colour() {
    printf '\e]11;%s\a' "$@"
}
function yt2rss() {
    CHANNEL_ID="$(curl "$1" 2>/dev/null | \
                       grep 'itemprop="channelId"' | cut -d'"' -f 4 )"
    echo "https://www.youtube.com/feeds/videos.xml?channel_id=$CHANNEL_ID"
}
alias dc="bash ~/projects/python/dict_cc/dict_cc $@"
alias myip="curl https://api.ipify.org"
alias ntka="python -m nuitka --follow-imports"

