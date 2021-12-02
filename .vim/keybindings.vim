" BEGIN -- $VIMRUNTIME/defaults.vim
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" END -- $VIMRUNTIME/defaults.vim

"Use Space as leader key
let mapleader = "\<space>"

" Smash jk to go back to normal mode and save
inoremap jk <ESC>
inoremap kj <ESC>
inoremap fd <ESC>
"inoremap df <ESC>

"Move by visual line
nnoremap j gj
nnoremap k gk

" Easier window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Tab to complete
" function! InsertTabWrapper()
"   let col = col('.') - 1
"   if !col || getline('.')[col - 1] !~ '\k'
"     return "\<tab>"
"   else
"     return "\<c-p>"
"   endif
" endfunction

" inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <S-Tab> <c-n>

" fzf from Modern Vim
nnoremap <C-p> :<C-u>FZF<CR>
