if &compatible
  set nocompatible
endif

" You can enable loading the plugin files for specific file types with:
filetype plugin on

syntax on

source $HOME/.vim/options.vim

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!

  " Set syntax highlighting for specific file types

  " Markdown files
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd FileType markdown setlocal spell nolist wrap lbr textwidth=80 colorcolumn=+1

  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile aliases.local,zshrc.local,*/zsh/configs/* set filetype=sh
  autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
  autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
  autocmd BufRead,BufNewFile vimrc.local set filetype=vim

  autocmd Filetype vimwiki setlocal spell nolist wrap lbr textwidth=80 colorcolumn=+1

  " Save buffers on focus lost
  autocmd FocusLost * :wa

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " Spell Checking for GitCommit
  " https://robots.thoughtbot.com/opt-in-project-specific-vim-spell-checking-and-word-completion
  autocmd FileType gitcommit setlocal spell textwidth=72 colorcolumn=+1

  " Storyboard files
  autocmd BufRead,BufNewFile *.storyboard set filetype=xml
  autocmd FileType xml setlocal wrap lbr
  autocmd FileType plist setlocal noexpandtab shiftwidth=4 tabstop=4

  " Don't line wrap swift files
  autocmd FileType swift setlocal nowrap
  autocmd FileType swift nnoremap <buffer> <leader>d :call DrString#Format()<cr>
  autocmd FileType swift vnoremap <buffer> <leader>d :call DrString#Format()<cr>
  autocmd FileType swift setlocal commentstring="// %s"
  autocmd FileType swift setlocal colorcolumn=120

  " Re-load buffers when vim focus is re-gained
  set autoread
  autocmd FocusGained * checktime

  " use tabs for .gitconfig file
  autocmd Filetype gitconfig setlocal ts=4 sw=4 sts=0 noexpandtab

  " use 2 spaces for Ruby
  autocmd Filetype ruby setlocal ts=2 sw=2 sts=2

  " use 2 spaces for j son
   autocmd Filetype json setlocal ts=2 sw=2 sts=2
   let g:vim_json_conceal = 0 " don't conceal my json


   autocmd FileType plist setlocal nowrap noexpandtab shiftwidth=4 tabstop=4

augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

source $HOME/.vim/keybindings.vim

" Use MinPac to manager Plugins
" https://github.com/k-takata/minpac
packadd minpac
call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('tpope/vim-sensible')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-commentary')

" https://github.com/christoomey/vim-conflicted
call minpac#add('christoomey/vim-conflicted')


call minpac#add('mileszs/ack.vim')

call minpac#add('elzr/vim-json')

call minpac#add('SirVer/ultisnips')
call minpac#add('vimwiki/vimwiki')

" Swift
call minpac#add('keith/swift.vim')
call minpac#add('prabirshrestha/async.vim')
call minpac#add('prabirshrestha/vim-lsp')
call minpac#add('dduan/DrString.vim')

" Markdown
call minpac#add('godlygeek/tabular') " Tabular must come before vim-markdown
call minpac#add('plasticboy/vim-markdown')

"Gruvbox
call minpac#add('morhetz/gruvbox')

"Rust
call minpac#add('rust-lang/rust.vim')

packloadall

" minpac commands:
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_clear_cache_on_exit = 1 "Keep cache across sessions
let g:ctrlp_lazy_update = 50 "wait 50ms till typing stops

" Make ack.vim use ag.
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack

" Configure ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"

" Configure vim-markdown
let g:vim_markdown_folding_disabled = 1

" Configure Git / Rhubarb
let g:github_enterprise_urls = ['https://gecgithub01.walmart.com']

nnoremap <leader>gnc :GitNextConflict<cr>

" configure colorscheme
augroup Gruvbox
    autocmd!
    autocmd vimenter * colorscheme gruvbox
    set background=dark    " Setting dark mode
augroup END

augroup quickfix
    autocmd!
    autocmd FileType qf setlocal nowrap
augroup END

source $HOME/.vim/statusline.vim

" Configure LSP for Swift
if executable('sourcekit-lsp')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'sourcekit-lsp',
                \ 'cmd': {server_info->['sourcekit-lsp']},
                \ 'whitelist': ['swift'],
                \ })
endif

" Leaders for vimrc
map <Leader>ve :edit ~/.vimrc<CR>
map <Leader>vs :source ~/.vimrc<CR>

" Python mode
augroup Python
  autocmd!
  autocmd FileType python nnoremap <buffer> <Leader>r :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
augroup END
