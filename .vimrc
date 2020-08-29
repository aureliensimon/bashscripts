call plug#begin('~/.vim/plugged')
	Plug 'kaicataldo/material.vim'
	Plug 'itchyny/lightline.vim'
	Plug 'luochen1990/rainbow'
	Plug 'airblade/vim-gitgutter'
	Plug 'preservim/nerdtree'
	Plug 'preservim/nerdcommenter'
call plug#end()

set laststatus=2
set number
set belloff=all

" Comment	:	, + cc
" Uncomment	:	, + ci
let mapleader=","
set timeout timeoutlen=1500

" Hide / Show NERDTree	:	NERDTreeToggle"
autocmd vimenter * NERDTree
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

