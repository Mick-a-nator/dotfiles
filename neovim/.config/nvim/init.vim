" General
set nocompatible	" disable compatibility to classic vi
set hlsearch		" HighLight search matches
set lazyredraw      " Don't animate macros etc.
set number		" show line number(s)
set rnu			" show relative line numbers
set cursorline  " highlight current line of cursor
set fileencodings+=utf-8
set encoding=utf-8

" Tabs & Whitespace
set tabstop=4		" column width of tab character
set softtabstop=4	" treat groups of 4 spaces like a tab char
set expandtab		" convert tabs to spaces
set shiftwidth=4	" auto-indent width
filetype plugin indent on "auto-indent based on file type

" Editor niceties
syntax on
"set wildmode=list:longest	" bash-like tab completions (?)

" vim-plug plugins "
call plug#begin()
" Style
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
"Plug 'sheerun/vim-polyglot' "Improved syntax highlighting etc.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" File browser
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'

" Remote pairing
Plug 'jbyuki/instant.nvim', { 'on': ['InstantStartSession', 'InstantJoinSession'] }

" Additional functions
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'chaoren/vim-wordmotion'
Plug 'yggdroot/indentline'  " Show indentation levels
Plug 'scrooloose/nerdcommenter'

" IDEA-like stuff
Plug 'neovim/nvim-lspconfig' " https://github.com/neovim/nvim-lspconfig
Plug 'nvim-lua/plenary.nvim' " required for telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " fzf-style matching for telescope
Plug 'nvim-telescope/telescope.nvim' " Fuzzy finder

" Completions
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'airblade/vim-gitgutter'

call plug#end()

let NERDTreeShowHidden = 1

let g:instant_username = 'mdeakin'

lua << EOF
require('theme')
require('keymap')
require('lsp') -- Language Server Protocol
require('telescope-config')
EOF

