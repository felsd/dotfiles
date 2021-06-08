call plug#begin('~/.vim/plugged')
Plug 'chankaward/vim-railscasts-theme'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'brentyi/isort.vim'
Plug 'dylanaraps/wal.vim'
Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'
Plug 'davidhalter/jedi-vim'
Plug 'gko/vim-coloresque'
Plug 'preservim/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/MatchTag'
Plug 'jceb/vim-orgmode'
Plug 'mattn/emmet-vim'
call plug#end()

" Color scheme
colorscheme railscasts
set background=light
hi Normal ctermbg=none

" Colors of folded sections
hi Folded ctermbg=darkgray
hi Folded ctermfg=white

" KEYBINDINGS
" Set leaderkey to space
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"
" Set localleader to ;
let maplocalleader = ";"
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
" Navigate through buffers
map <Leader>bb :buffers<CR>:b 
map <Leader><Tab> :bp<CR>
map <Leader>bp :bp<CR>
map <Leader>bn :bn<CR>
" Kill current buffer
map <Leader>wx :bd<CR>
" Quit current buffer
map <Leader>wq :q!<CR>
" Quit all buffers
map <Leader>qq :qa!<CR>
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
" Git
map <Leader>gs :Git<CR>
map <Leader>gc :Git commit<CR>
map <Leader>gpu :Git push<CR>
map <Leader>gpl :Git pull<CR>
map <Leader>glog :Gclog<CR>
map <Leader>gm :Git merge<CR>
map <Leader>gf :Git fetch<CR>
" Refresh GitGutter in all buffers
map <Leader>gg :bufdo execute ":GitGutter"<CR>
" Emmet
map <Leader>ee <c-y>,i
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
  augroup setCursor
      au!
      autocmd VimEnter * silent !echo -ne "\ePtmux;\e\e[2 q\e\\"
      autocmd VimEnter * redraw!
  augroup end
else
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[2 q"
  augroup setCursor
      au!
      autocmd VimEnter * silent !echo -ne "\e[2 q"
      autocmd VimEnter * redraw!
  augroup end

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
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab

" Don't treat underscore as keyword
set iskeyword-=_

" hybrid line numbers
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Python syntax highlighting
let g:python_highlight_builtins=1
let g:python_highlight_builtin_objs=1
let g:python_highlight_builtin_types=1
let g:python_highlight_builtin_funcs=1
let g:python_highlight_builtin_funcs_kwarg=1
let g:python_highlight_exceptions=1
let g:python_highlight_string_formatting=1
let g:python_highlight_string_format=1
let g:python_highlight_string_templates=0
let g:python_highlight_indent_errors=1
let g:python_highlight_space_errors=1
let g:python_highlight_doctests=1
let g:python_highlight_func_calls=0
let g:python_highlight_class_vars=1
let g:python_highlight_operators=1
let g:python_highlight_file_headers_as_comments=1
let g:python_slow_sync=1

" Xresources files
autocmd BufReadPost ~/.Xresources.d/* setf xdefaults
" au BufNewFile,BufRead .Xdefaults,.Xpdefaults,.Xresources,xdm-config,*.ad setf xdefaults
" Run xrdb automatically
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
autocmd BufWritePost ~/.Xresources.d/* !xrdb ~/.Xresources

" Run isort before saving .py files
autocmd BufWritePost *.py execute ':Isort'
" Run black before saving .py files
autocmd BufWritePre *.py execute ':Black'

" Restart sxhkd after changing the bindings
autocmd BufWritePost *sxhkdrc !pkill sxhkd && sxhkd &

" Set colors of highlighted text
hi Visual ctermbg=0 ctermfg=15 cterm=reverse term=reverse

" nerdtree
map <C-o> :NERDTreeToggle<CR>

" Neomake
call neomake#configure#automake('wn', 200)

" Gitgutter
" vim-gitgutter used to do this by default:
highlight! link SignColumn LineNr
" or you could do this:
highlight SignColumn guibg=NONE ctermbg=NONE

set laststatus=2
