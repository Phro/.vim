"let b:current_syntax = ''
"unlet b:current_syntax
"runtime! syntax/tex.vim

"let b:current_syntax = ''
"unlet b:current_syntax
"syntax include @TeX syntax/tex.vim

"let b:current_syntax = ''
"unlet b:current_syntax
"syntax include @Asy syntax/asy.vim
"syntax region asyCode matchgroup=Snip start="\\begin{asy}" end="\\end{asy}" containedin=@TeX contains=@Asy
"syntax region asyCode matchgroup=Snip start="\\begin{asy}" end="\\end{asy}" containedin=@TeX contains=@Asy

"hi link Snip SpecialComment
"let b:current_syntax = 'tex'

"syntax include @ASY syntax/asy.vim
"syntax region asySnip matchgroup=Snip start="\\begin{asy}" end="\\end{asy}" contains=@ASY
"hi link Snip SpecialComment

"runtime! syntax/tex.vim " I believe this is the cause of the recursion.
"unlet b:current_syntax
"syntax include @Asy syntax/asy.vim
"syntax region asyCode  start=+\\begin{asydef}+ keepend end=+\\end{asydef}+  contains=@Asy
