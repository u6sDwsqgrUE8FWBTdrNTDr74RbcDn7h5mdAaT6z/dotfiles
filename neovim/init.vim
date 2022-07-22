runtime! archlinux.vim

filetype plugin on
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'Mofiqul/vscode.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'aserowy/tmux.nvim'
call plug#end()

filetype plugin indent on
syntax on
set background=dark
set termguicolors
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

set spelllang=en_us,da
set spellsuggest=best,9
nnoremap <silent> <F12> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

let mapleader=","

let g:coc_global_extensions = ['coc-json', 'coc-clangd', 'coc-pyright', 'coc-texlab', "coc-sh", "coc-html", "coc-markdownlint"]

set t_Co=256
colorscheme vscode

lua << EOF
require('lualine').setup {
    options = {
      theme = 'vscode',
      section_separators = '',
      component_separators = '|',
      globalstatus = true,
    }
  }
EOF

lua << EOF
require("indent_blankline").setup {
    show_current_context = true,
}
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
      enable = false,
      extended_mode = true,
      max_file_lines = nil,
    },
  }
EOF

lua << EOF
require'nvim-web-devicons'.setup {
 default = true;
}
EOF

lua << EOF
require'nvim-tree'.setup {
}
EOF

lua << EOF
local dap = require('dap')

dap.adapters.python = {
  type = 'executable';
  command = 'python';
  args = { '-m', 'debugpy.adapter' };
}
dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";

    program = "${file}";
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
EOF

lua << EOF
require("dapui").setup()
EOF

lua << EOF
require("tmux").setup(
{
  copy_sync = {
    enable = true,
    ignore_buffers = { empty = false },
    redirect_to_clipboard = true,
    register_offset = 0,
    sync_clipboard = true,
    sync_deletes = true,
    sync_unnamed = true,
    },

  navigation = {
    cycle_navigation = false,
    enable_default_keybindings = true,
    persist_zoom = false,
    },

  resize = {
    enable_default_keybindings = true,
    resize_step_x = 1,
    resize_step_y = 1,
    },
}
)
EOF

nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <C-b> <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>bc <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl <Cmd>lua require'dap'.run_last()<CR>

nnoremap <silent> <leader>db :lua require("dapui").toggle()<CR>
nnoremap <leader>e <Cmd>lua require("dapui").eval()<CR>

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1

let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_respect_buf_cwd = 1
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 }

nnoremap <silent> <C-f> :NvimTreeToggle<CR>
nnoremap <silent> <leader>r :NvimTreeRefresh<CR>

nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
nnoremap <silent>    <A-p> :BufferPin<CR>
nnoremap <silent>    <A-c> :BufferClose<CR>
nnoremap <silent>    <C-s> :BufferPick<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fc <cmd>Telescope git_commits<cr>
nnoremap <leader>fb <cmd>Telescope git_bcommits<cr>
nnoremap <leader>fr <cmd>Telescope lsp_references<cr>

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
nnoremap <C-i> :let @z=input('') <bar> norm "zp<CR>
let g:UltiSnipsSnippetDirectories=["UltiSnips", "nvim-snippets"]

nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
