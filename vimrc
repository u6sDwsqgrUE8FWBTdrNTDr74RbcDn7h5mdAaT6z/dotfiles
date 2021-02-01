runtime! archlinux.vim

filetype plugin on
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
call plug#end()

syntax on
set background=dark
set title
set number relativenumber
set showcmd
set hlsearch
set nomodeline
set ruler
set laststatus=2
set clipboard+=unnamedplus
