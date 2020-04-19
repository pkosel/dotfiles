call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'stillwwater/vim-nebula'
Plug 'tpope/vim-commentary'

call plug#end()

if has('termguicolors')
  set termguicolors
endif

set background=dark
colorscheme nebula

let mapleader=","

set number
set showmatch

set ignorecase
set smartcase

set expandtab
set tabstop=2
set shiftwidth=2


"autocommand FileType c setlocal commentstring=//\ %s

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

