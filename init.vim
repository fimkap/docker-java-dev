" VIM-PLUG Setup {{{
" Automatic installation {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !mkdir -p ~/.config/nvim/autoload
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * PlugInstall
endif
" }}}
call plug#begin('~/.config/nvim/plugged')
Plug 'rakr/vim-one'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()
let mapleader      = ' '
let maplocalleader = ' '
filetype plugin indent on
set nobackup
set nowritebackup
set noswapfile
set autoread
set shortmess+=c
set mousemodel=extend
set mouse=a
colorscheme one
set background=dark
let g:deoplete#enable_at_startup=1
autocmd FileType java setlocal omnifunc=javacomplete#Complete
if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python'
