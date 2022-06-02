function! MyFoldText()
        let line = foldlevel(v:foldstart) . ': ' . 
                \ substitute(getline(v:foldstart),
                \ '\v%(^\s*)" ?|:$|:? ?(\{{3}\d)$', '', 'g') . ' '
        let lines_count = v:foldend - v:foldstart + 1
        let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
        " let foldchar = matchstr(&fillchars, 'fold:\zs.')
        let foldchar = ' '
        let foldtextstart = strpart(line, 0, (winwidth(0)*2)/3)
        let foldtextend = lines_count_text . repeat(foldchar, 8)
        let foldtextlength = strlen(substitute(foldtextstart . foldtextend,
                \ '.', 'x', 'g')) + &foldcolumn
        return foldtextstart . repeat(' ', winwidth(0)-foldtextlength)
                \ . foldtextend
endfunction
setlocal foldtext=MyFoldText()
