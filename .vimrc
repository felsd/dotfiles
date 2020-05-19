
call plug#begin('~/.vim/plugged')
Plug 'dylanaraps/wal.vim'
call plug#end()


source ~/.vim-plugins/tcomment/autoload/tcomment.vim
source ~/.vim-plugins/tcomment/plugin/tcomment.vim

" Set leaderkey to space
let mapleader = " "

" Exit insert mode with fd
imap fd <Esc>

" Enable clipboard
set clipboard=unnamedplus

" Show split right
set splitbelow splitright

" Enable autocompletion
set wildmode=longest,list,full

" show line numbers
set number
highlight LineNr ctermfg=darkGray

" set default indent to 2 spaces
set shiftwidth=2
set softtabstop=2

" size of a hard tabstop
set tabstop=4

" always uses spaces instead of tab characters
set expandtab

" size of an "indent"
set shiftwidth=4

" 4 spaces indent
autocmd FileType python setlocal shiftwidth=4 softtabstop=2 expandtab

" Run xrdb after editing Xdefaults or Xresources
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
