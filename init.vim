runtime! archlinux.vim

filetype plugin on
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
call plug#end()

let g:coc_global_extensions = ['coc-json', 'coc-clangd', 'coc-pyright', 'coc-texlab', 'coc-explorer']
nmap <space>e <Cmd>CocCommand explorer<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

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
