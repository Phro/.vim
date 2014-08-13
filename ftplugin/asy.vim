setlocal makeprg=asy\ %
setlocal errorformat=%f:\ %l.%c:\ %m
setlocal tw=80
"setlocal shellpipe=2>&1\ >
" Toggle all lines with the write command in them (could be dangerous if essential code is on the same line as a write command, but this should be syntactically avoided.
noremap <buffer> <LocalLeader>aw :%g-write(-call NERDComment(0,'toggle')<CR>:noh<cr>
nnoremap <LocalLeader>mv :make -V<cr>
