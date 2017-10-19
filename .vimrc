set t_Co=256 " Enable 256 colors for teminal vim
set nocompatible " Don't be vi compatible
set list " Show tabs and trailing spaces

if has('clipboard')     " If the feature is available
    set clipboard=unnamed " copy to the system clipboard
    if has('unnamedplus')
        set clipboard+=unnamedplus
    endif
endif

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

" Use MinPac to manager Plugins
" https://github.com/k-takata/minpac
packadd minpac
call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('jez/vim-github-hub')
call minpac#add('tpope/vim-sensible')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-git')
call minpac#add('kien/ctrlp.vim')
call minpac#add('nathanaelkane/vim-indent-guides')
call minpac#add('bronson/vim-trailing-whitespace')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('valloric/listtoggle')
call minpac#add('keith/swift.vim')
call minpac#add('vim-syntastic/syntastic')
call minpac#add('gfontenot/vim-xcode')
call minpac#add('tpope/vim-markdown')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-fugitive')
call minpac#add('junegunn/gv.vim')
call minpac#add('christoomey/vim-conflicted')
call minpac#add('trevordmiller/nova-vim')
call minpac#add('raichoo/purescript-vim')
call minpac#add('vimwiki/vimwiki')

packloadall

" minpac commands:
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

set updatetime=250 "Faster update time for GitGutter

if executable('ag')
    " User Silver Searcher instead of grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Make CtrlP use ag for listing the files. Way faster and no useless files.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

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
autocmd FileType gitcommit setlocal spell textwidth=72 colorcolumn=+1
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Spell-check Markdown files
autocmd FileType markdown setlocal spell nolist wrap lbr

" Don't line wrap swift files
autocmd FileType swift setlocal nowrap

" Don't warn on focus lost for files with no name
autocmd FocusLost * nested silent! wall

augroup quickfix
    autocmd!
    autocmd FileType qf setlocal nowrap
augroup END
" use tabs for .gitconfig file
autocmd Filetype gitconfig setlocal ts=4 sw=4 sts=0 noexpandtab


" Set spellfile to location that is guaranteed to exist,
" can be symlinked to Dropbox or kept in Git
" and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

colorscheme nova

"More natural Splits
set splitbelow
set splitright
colorscheme onedark

"Configure Vim-Xcode
let g:xcode_default_simulator = 'iPhone 5s'
set secure " Don't let external configs do scary shit
set exrc   " Load local vimrc if found

" bind K to grep word under the cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Settings for vimwiki
" Store wiki in dropbox folder
" use markdown syntax
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki',
                       \ 'syntax': 'markdown', 'ext': '.md'}]

