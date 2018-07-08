setlocal makeprg=latexmk\ -pdf\ %
setlocal errorformat=%f:\ %l.%c:\ %m
setlocal fdm=syntax
"setlocal textwidth=0 " For long paragraphs.
nnoremap <buffer> <LocalLeader>w :make <cr>:!mupdf -C FF9800 %<.pdf&<CR>
nnoremap <LocalLeader>v :!mupdf -C FF9800 %<.pdf&<cr><cr>
" This is for math
nnoremap <LocalLeader>em :vs ~/texmf/tex/latex/math.cls<cr>
nnoremap <buffer> <LocalLeader>M :call ForceMake()<cr>

function! ForceMake()
  let oldmakeprg = &l:makeprg
  try
    " set new value of makeprg and call the function
    set makeprg=latexmk\ -gg\ -pdf\ %
    make
  finally
    " set makeprg back to old value
    let &l:makeprg = oldmakeprg
  endtry
endfunction

