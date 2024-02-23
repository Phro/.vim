-- setlocal makeprg=python\ %
-- " nnoremap <buffer> <localleader>M :vs +term\ python<cr>
-- nnoremap <buffer> <leader>m :vs +term\ python\ -i\ %<cr>
-- " nnoremap <buffer> <localleader>sm :vs +term\ sage<cr>iattach('<c-r>=expand('#')<cr>')<cr>
-- nnoremap <buffer> <localleader>ss :vs +term\ sage<cr>i

vim.b.runProject = "python -i %"
