call plug#begin('~/.vim/plugged')
	Plug 'kaicataldo/material.vim'
	Plug 'itchyny/lightline.vim'
	Plug 'luochen1990/rainbow'
	Plug 'airblade/vim-gitgutter'
call plug#end()

set laststatus=2
set number
set belloff=all

let g:rainbow_active=1

" Set theme
colorscheme material
if (has('termguicolors'))
  set termguicolors
endif
let g:material_theme_style = 'darker'

" Set tree Explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

