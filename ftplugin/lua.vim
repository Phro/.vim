setlocal makeprg=lua\ %
nnoremap <buffer> <localleader>w :vs +term\ lua\ -i\ %<cr>i
