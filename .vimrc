set t_Co=256 " Enable 256 colors for teminal vim
set nocompatible " Don't be vi compadfasdftible
set list " Show tabs and trailing spaces
set clipboard=unnamed " use the system clipboard

" Smash jk to go back to normal mode and save
inoremap jk <ESC>:w<CR>
inoremap kj <ESC>:w<CR>

" Default to 4 spaces per tab
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

"Put Undo Files and Such someplace nice
set backupdir=~/.tmp
set directory=~/.tmp "Don't clutter up my dirs with swp and tmp files
set undodir=~/.tmp

set undofile " Saves Undo History to an Undo file,

set hidden "Allow of screen buffers to contain changes
set ttyfast "I have a fast tty draw faster
set number "Show line numbers for the currentline
set relativenumber "show relative numbers for others

let mapleader = "\<space>" "Use Space as leader key

set ignorecase "Use case insensitive search
set smartcase  "overrides ignorecase if there is a capital
set hlsearch   "Hilight search matches

set showmatch "show matching bracket
set colorcolumn=80 "Highlight column 80

"Move by visual line
nnoremap j gj
nnoremap k gk

" Easier window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use VimPlug to manage Plugins
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'kien/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'valloric/listtoggle'
Plug 'keith/swift.vim'
Plug 'edkolev/tmuxline.vim'
call plug#end()

set updatetime=250 "Faster update time for GitGutter
let g:airline_powerline_fonts = 1 "Use Powerline fonts
let g:airline#extensions#tabline#enabled = 1 "when no tabs open show buffers
let g:airline#extensions#tmuxline#enabled = 0 "Don't let airline override tmuxline
autocmd VimEnter * AirlineTheme base16
" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Source .vimrc on save
autocmd bufwritepost .vimrc source $MYVIMRC

" Save on focus lost
autocmd FocusLost * :wa

" Spell Checking for GitCommit and Markdown files
" https://robots.thoughtbot.com/opt-in-project-specific-vim-spell-checking-and-word-completion
autocmd FileType gitcommit setlocal spell
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Spell-check Markdown files
autocmd FileType markdown setlocal spell

" Don't line wrap swift files
autocmd FileType swift setlocal nowrap

" Don't warn on focus lost for files with no name
autocmd FocusLost * nested silent! wall

" Set spellfile to location that is guaranteed to exist,
" can be symlinked to Dropbox or kept in Git
" and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Use dark colour scheme based on Atom
colorscheme onedark

