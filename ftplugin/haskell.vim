setlocal makeprg=ghc\ -o\ %<\ %
"setlocal makeprg=ghc\ -o\ %<\ %\ &&\ %<
setlocal errorformat=%f:\ %l.%c:\ %m
"unmap <buffer> <LocalLeader>m<Space>
nnoremap <buffer> <LocalLeader>m :w!<cr>:make<cr>
" Run current file, if file exists. Pump output into new, non-modifiable,
" non-modified buffer. The "./" akes this more universal, but shouldn't be
" necessary for my platform.

"nnoremap <buffer> <LocalLeader>v :belowright 10split +term\ %:r<cr>
" nnoremap <buffer> <LocalLeader>v :belowright 15split +term\ runhaskell\ %<cr>
" nnoremap <buffer> <LocalLeader>V :below 5new\|0read !./#:r<cr>:set nomod<cr>
nnoremap <buffer> <LocalLeader>V :!%< && see %<.ppm&<cr>
nnoremap <buffer> <LocalLeader>v :!%<<cr>
nnoremap <buffer> <localleader>w :rightbelow sp +term\ ghci\ %:r<cr>

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

set nospell
