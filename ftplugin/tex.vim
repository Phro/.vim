setlocal makeprg=latexmk\ -pdf\ %
setlocal errorformat=%f:\ %l.%c:\ %m
setlocal fdm=syntax
"setlocal textwidth=0 " For long paragraphs.
nnoremap <buffer> <LocalLeader>mv :w!<CR>:make <cr>:!evince %<.pdf<CR>
nnoremap <LocalLeader>v :!evince %<.pdf<cr><cr>
