" Keep a backup file (restore to previous version)
set backup
" Put Backup Files someplace nice
set backupdir=~/.tmp
set backupcopy=auto

if has('persistent_undo')
  set undofile " Saves Undo History to an Undo file, (undo changes after closing)
  set undodir=~/.tmp
endif

" Swap files go in .tmp too
set directory=~/.tmp "Don't clutter up my dirs with swp and tmp files

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Show tabs and trailing spaces
set list

if has('clipboard')     " If the feature is available
    set clipboard=unnamed " copy to the system clipboard
    if has('unnamedplus')
        set clipboard+=unnamedplus
    endif
endif

" Default to 4 spaces per tab
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4


set hidden "Allow of screen buffers to contain changes
set ttyfast "I have a fast tty draw faster
set number "Show line numbers for the currentline
set relativenumber "show relative numbers for others

set ignorecase "Use case insensitive search
set smartcase  "overrides ignorecase if there is a capital

set colorcolumn=80 "Highlight column 80

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full

" ignore caches directories
set wildignore+=*/tmp/*,*/Caches/*,*/build/*,*.so,*.swp,*.zip

" Set spellfile to location that is guaranteed to exist,
" can be symlinked to Dropbox or kept in Git
" and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" More natural Splits
set splitbelow
set splitright

set background=dark

set magic " Use grep style regex when searching.

set scrolloff=4 "Keep a few lines of overlap when scrolling or 'zt'ing

set cmdheight=2 "use 2 lines for the command area
