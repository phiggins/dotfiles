if has("gui_gtk2")
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
endif 

" http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

set mousemodel=popup

" close to 80, leave some buffer for line numbers, etc
set columns=85
set lines=24
