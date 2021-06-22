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
set nobackup
set nowritebackup
set noswapfile

" Fix backspace on mac
set backspace=indent,eol,start

" Show otherwise hidden whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" If a file is changed outside of vim, automatically reload it without asking
set autoread

let mapleader=","

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" These are different in a subtle way that I do not want.
inoremap <c-c> <esc>

nnoremap <c-]> :ALEGoToDefinition<cr>
nnoremap <leader>d :ALEGoToDefinition<cr>
nnoremap <leader>D :ALEGotoTypeDefinition<cr>

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
Plug 'vim-ruby/vim-ruby'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'dense-analysis/ale'
call plug#end()

"
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

" list files with git if we're in a git project, find otherwise
let file_list_command = "if git status --porcelain >/dev/null 2>&1 ; then git ls-files -co --exclude-standard ; else find . -type f ; fi"
nnoremap <leader>f :call FzyCommand(file_list_command, ":e")<cr>
nnoremap <leader>v :call FzyCommand(file_list_command, ":vs")<cr>

" Compute syntax highlighting from beginning of file. (By default, vim only
" looks 200 lines back, which can make it highlight code incorrectly in some
" long files.)
autocmd BufEnter * :syntax sync fromstart

" Vim 8.2 adds built-in JSX support which seems broken. Setting these
" filetypes lets the installed plugins deal with JSX/TSX instead.
autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx
autocmd bufnewfile,bufread *.jsx set filetype=javascript.jsx

"
" ALE config
"
let g:ale_linters = {'typescript': ['tsserver', 'eslint'], 'typescript.tsx': ['tsserver', 'eslint']}
let g:ale_fixers = {'typescript': ['eslint'], 'typescript.tsx': ['eslint'], '*': ['remove_trailing_lines', 'trim_whitespace']}

let g:ale_javascript_eslint_executable = "./.yarn/sdks/eslint/bin/eslint.js"
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_delay = 0

nnoremap gj :ALENextWrap<cr>
nnoremap gk :ALEPreviousWrap<cr>
nnoremap g1 :ALEFirst<cr>
