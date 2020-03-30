call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-commentary'

call plug#end()

let mapleader=","

set number
set showmatch

set ignorecase
set smartcase

set expandtab
set tabstop=2
set shiftwidth=2


autocommand FileType c setlocal commentstring=//\ %s

