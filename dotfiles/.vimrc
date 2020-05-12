imap fd <Esc>

source ~/.vim-plugins/tcomment/autoload/tcomment.vim
source ~/.vim-plugins/tcomment/plugin/tcomment.vim

set clipboard=unnamedplus

" show line numbers
set number
highlight LineNr ctermfg=darkGray

" set default indent to 2 spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2

" 4 spaces indent
autocmd FileType python setlocal shiftwidth=4 softtabstop=2 expandtab
