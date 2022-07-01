# my dotfiles

## Cloning
`git clone https://github.com/felsd/dotfiles.git ~/.dotfiles`

## zsh
```
mkdir -p ~/.config/zsh
cp ~/.dotfiles/.config/zsh/.zshrc ~/.config/zsh/
cp ~/.dotfiles/.config/zsh/zsh-syntax-highlighting-custom.zsh ~/.config/zsh/
mkdir -p ~/.config/shell
cp ~/.dotfiles/.config/shell/aliasrc ~/.config/shell/
cp ~/.dotfiles/.config/shell/inputrc ~/.config/shell/
cp ~/.dotfiles/.config/shell/profile ~/.config/shell/
ln -s ~/.config/shell/profile ~/.zprofile
chsh -s $(which zsh)
```

## vim
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

```
