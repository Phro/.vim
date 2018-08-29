setlocal makeprg=asy\ -f\ pdf\ %
setlocal errorformat=%f:\ %l.%c:\ %m
setlocal tw=80
"setlocal shellpipe=2>&1\ >
" Toggle all lines with the write command in them (could be dangerous if essential code is on the same line as a write command, but this should be syntactically avoided.
noremap <buffer> <LocalLeader>aw :%g-write(-call NERDComment(0,'toggle')<CR>:noh<cr>
"nnoremap <buffer> <LocalLeader>mv :w!<cr>:make -V<cr>
nnoremap <buffer> <LocalLeader>m :w!<cr>:make<cr>
nnoremap <buffer> <LocalLeader>v :make<cr>:!mupdf %<.pdf &<cr>
"nnoremap <buffer> <LocalLeader>V :!asy -V % &<cr>

nnoremap <buffer> <LocalLeader>V :call See3D()<cr>
function! See3D()
  let oldmakeprg = &l:makeprg
  try
    " set new value of makeprg and call the function
    set makeprg=asy\ -V\ %
    make
  finally
    " set makeprg back to old value
    let &l:makeprg = oldmakeprg
  endtry
endfunction
