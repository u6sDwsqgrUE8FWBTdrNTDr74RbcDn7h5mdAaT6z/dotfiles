runtime! archlinux.vim

filetype plugin on
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'tomasiser/vim-code-dark'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
call plug#end()

lua require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.texlab.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.ccls.setup{on_attach=require'completion'.on_attach}
set completeopt=menuone,noinsert,noselect
set shortmess+=c
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set t_Co=256
let g:codedark_conservative = 1
colorscheme codedark
let g:airline_theme = 'codedark'
let g:airline_symbols_ascii = 1

syntax on
set background=dark
set title
set number relativenumber
set cursorline
set showcmd
set noshowmode
set hlsearch
set nomodeline
set ruler
set laststatus=2
set clipboard+=unnamedplus
