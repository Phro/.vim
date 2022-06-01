setlocal makeprg=python\ %
" nnoremap <buffer> <localleader>M :vs +term\ python<cr>
nnoremap <buffer> <localleader>w :vs +term\ python\ -i\ %<cr>i
" nnoremap <buffer> <localleader>sm :vs +term\ sage<cr>iattach('<c-r>=expand('#')<cr>')<cr>
nnoremap <buffer> <localleader>ss :vs +term\ sage<cr>i
