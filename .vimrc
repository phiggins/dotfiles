" This must be first, because it changes other options as side effect
set nocompatible

set nu
set expandtab
" colorscheme evening

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

" Fix backspace on mac
set backspace=indent,eol,start

" Show otherwise hidden whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let mapleader=","

" http://ctrlpvim.github.io/ctrlp.vim/#installation
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<leader>f'
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = ''
let g:ctrlp_max_files=0

filetype plugin indent on
syntax on

set nobackup
set nowritebackup
set noswapfile

autocmd FileType erlang setlocal shiftwidth=4 tabstop=4
