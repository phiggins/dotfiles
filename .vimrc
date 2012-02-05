" This must be first, because it changes other options as side effect
set nocompatible

set nu
set expandtab
colorscheme evening

set hidden
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set copyindent
set showmatch
set hlsearch
set title
set visualbell
set noerrorbells

" Show otherwise hidden whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Nightmare mode
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

let mapleader=","

" ctrlp stuff
let g:ctrlp_map = '<leader>t'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn\|tmp$'

filetype plugin indent on

set nobackup
set nowritebackup
set noswapfile
