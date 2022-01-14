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
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
call plug#end()

let g:coc_global_extensions = ['coc-json', 'coc-clangd', 'coc-pyright', 'coc-texlab']

let mapleader=","

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
set hidden
set showcmd
set noshowmode
set hlsearch
set nomodeline
set ruler
set laststatus=2
set clipboard+=unnamedplus
set mouse+=a
set signcolumn=yes

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
