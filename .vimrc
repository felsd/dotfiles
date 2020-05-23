call plug#begin('~/.vim/plugged')
Plug 'dylanaraps/wal.vim'
Plug 'neomake/neomake'
Plug 'vim-python/python-syntax'
Plug 'gko/vim-coloresque'
Plug 'preservim/nerdtree'
Plug 'editorconfig/editorconfig-vim'
call plug#end()


source ~/.vim/tcomment/autoload/tcomment.vim
source ~/.vim/tcomment/plugin/tcomment.vim

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


" Xresources files
autocmd BufReadPost ~/.Xresources.d/* setf xdefaults
" au BufNewFile,BufRead .Xdefaults,.Xpdefaults,.Xresources,xdm-config,*.ad setf xdefaults
" Run xrdb automatically
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
autocmd BufWritePost ~/.Xresources.d/* !xrdb ~/.Xresources

" Restart sxhkd after changing the bindings
autocmd BufWritePost *sxhkdrc !pkill sxhkd && sxhkd &

" Set colors of highlighted text
hi Visual ctermbg=0 ctermfg=15 cterm=reverse term=reverse

" nerdtree
map <C-o> :NERDTreeToggle<CR>

" Neomake
call neomake#configure#automake('w')
