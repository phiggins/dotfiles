" This must be first, because it changes other options as side effect
set nocompatible

set nu
set expandtab

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

call plug#begin('~/.vim/plugged')
Plug 'vim-ruby/vim-ruby'
call plug#end()

" vim-ruby setup
"
" Do this:
"   first
"     .second do |x|
"       something
"     end
" Not this:
"   first
"     .second do |x|
"     something
"   end
:let g:ruby_indent_block_style = 'do'
" Do this:
"     x = if condition
"       something
"     end
" Not this:
"     x = if condition
"           something
"         end
:let g:ruby_indent_assignment_style = 'variable'

set nobackup
set nowritebackup
set noswapfile

" apt get install fzy
" https://github.com/jhawthorn/fzy
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>f :call FzyCommand("find . -type f", ":e")<cr>
nnoremap <leader>v :call FzyCommand("find . -type f", ":vs")<cr>
