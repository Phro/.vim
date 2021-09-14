nnoremap <LocalLeader>v :!mathematica %&<cr><cr>
nnoremap <LocalLeader>m :vs term://rlwrap math -initfile %<cr>
nnoremap <LocalLeader>M :tabedit term://rlwrap math -initfile %<cr>

" TODO: this should remember whether an interactive shell is open, delete it
" if it is, and create a new one in its stead (to be run with <leader>m).
function! CreateInteractiveShell()
  if exists(b:shellname)
    bdelete b:shellname
  endif
endfunction
