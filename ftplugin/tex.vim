setlocal makeprg=latexmk\ -pdf\ %
setlocal errorformat=%f:\ %l.%c:\ %m
setlocal fdm=syntax
"setlocal textwidth=0 " For long paragraphs.
nnoremap <buffer> <LocalLeader>w :make <cr>:!mupdf -C FF9800 %<.pdf&<CR>
nnoremap <LocalLeader>v :!mupdf -C FF9800 %<.pdf&<cr><cr>
