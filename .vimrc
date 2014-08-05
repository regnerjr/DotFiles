set nocompatible    " be improved
filetype off        " required

" set up Vundle
if has('win32')
   set rtp+=~/vimfiles/bundle/Vundle.vim/
   let path='~/vimfiles/bundle'
   nnoremap <leader>v :e c:\cygwin\home\regner.j\.vimrc<cr>
else
   set rtp+=~/.vim/bundle/Vundle.vim/
   let path='~/.vim/bundle'
   nnoremap <leader>v :e ~/.vimrc<cr>
endif
call vundle#begin(path)
" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
call vundle#end()
" end Vundle Setup

syntax on
filetype plugin indent on

set tabstop=3     "Number of spaces per TAB
set softtabstop=3 "Number of spaces in tab when editing
set expandtab     " tabs are spaces
set shiftwidth=3  " Width to use when aligning code with ==, >>, <<

set foldmethod=syntax
set foldenable
"use space to unfold folded code blocks
nnoremap <space> za 
set showmode
set wildmode=list:longest "Visual Auto-complete
set cursorline "Highlight current line
set undofile
set lazyredraw "Tell vim to redraw the screen less, leads to faster macros

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch "Highlight matching parens, braces, brackets
set hlsearch
nnoremap <leader><space> :nohlsearch<cr>

nnoremap <tab> %
vnoremap <tab> %

" Make j and k move by visual line
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jj <ESC>

nnoremap <leader>a :NERDTree home<cr>

au FocusLost * :wa " save on FocusLost
set hidden

" Visual {{{
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set background=dark
colorscheme solarized
"set g:solarized_hitrail
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
set novisualbell
set relativenumber
set linebreak
"}}}
