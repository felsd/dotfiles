call plug#begin('~/.vim/plugged')
Plug 'dylanaraps/wal.vim'
Plug 'neomake/neomake'
Plug 'vim-python/python-syntax'
Plug 'gko/vim-coloresque'
Plug 'preservim/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
call plug#end()

" KEYBINDING
" Set leaderkey to space
let mapleader = " "
" Exit insert mode with fd
imap fd <Esc>
" Reload syntax highlighting
noremap <F5> <Esc>:filetype detect<CR>

" Enable clipboard
set clipboard=unnamedplus

" Show split right
set splitbelow splitright

" Enable autocompletion
set wildmode=longest,list,full

" show line numbers
set number
highlight LineNr ctermfg=darkGray

" change cursor depending on mode
if exists('$TMUX')
  let &t_SI = "\ePtmux;\e\e[6 q\e\\"
  let &t_SR = "\ePtmux;\e\e[4 q\e\\"
  let &t_EI = "\ePtmux;\e\e[2 q\e\\"
  autocmd VimEnter * silent !echo -ne "\ePtmux;\e\e[2 q\e\\"
else
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[2 q"
  autocmd VimEnter * silent !echo -ne "\e[2 q"
endif
set ttimeoutlen=0

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

" hybrid line numbers
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END


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
call neomake#configure#automake('wn', 200)


set laststatus=2
