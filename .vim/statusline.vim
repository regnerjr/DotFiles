set statusline=[%n]\  " Buffer Number
set statusline+=%< " Truncate here if status too long
set statusline+=%.99f\  "Show file name (max width 99)
set statusline+=%h%q%w%m%r%y "Help, Quickfix, Preview, Modified, ReadOnly, Filetype
set statusline+=%= "Start right aligned items
set statusline+=%-16(%l,%c%) " Line and column with spacing
set statusline+=%P "Percent through file

"A conflicted status to my statusline
" https://github.com/christoomey/vim-conflicted
function! s:setupConflicted()
    set stl+=%{ConflictedVersion()}
    " Resolve and move to next conflicted file.
endfunction
autocmd vimrcEx User VimConflicted call s:setupConflicted()
