call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
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
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

""" SPACEMACS LIKE KEYBINDINGS START
" Save file
map <Leader>fs :w<CR>
" Window splits
map <Leader>wv <C-w>v
map <Leader>wn <C-w>n
" Navigate through open buffers
map <Leader>wh <C-w><Left>
map <Leader>wl <C-w><Right>
map <Leader>wj <C-w><Down>
map <Leader>wk <C-w><Up>
" Quit current buffer
map <Leader>wx :q<CR>
" Quit all buffers
map <Leader>qq :qa<CR>
" Open nerdtree
map <Leader>pt <C-o>
" Fuzzy search in project dir files
let g:ctrlp_map = '<Leader>pf'
let g:ctrlp_working_path_mode = 'ra'
" Fuzzy search in project dir file contents
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'
let g:ack_autoclose = 1
let g:ack_use_cword_for_empty_search = 1
cnoreabbrev Ack Ack!
function! Find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! -nargs=1 Ag execute "Ack! <args> " . Find_git_root()
nnoremap <Leader>/ :Ag<Space>
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
""" SPACEMACS LIKE KEYBINDINGS END

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
