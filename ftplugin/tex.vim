" setlocal makeprg=latexmk\ -pdflatex=lualatex\ -silent\ -pdf\ %
" setlocal makeprg=latexmk\ -pdflatex=lualatex\ -pdf\ %
setlocal makeprg=latexmk\ -pdflatex=pdflatex\ -pdf\ %
setlocal errorformat=%f:\ %l.%c:\ %m
setlocal fdm=syntax
"setlocal textwidth=0 " For long paragraphs.
nnoremap <buffer> <LocalLeader>w :make <cr>:!mupdf -C FF9800 %<.pdf&<CR>
nnoremap <LocalLeader>v :!see  %<.pdf&<cr><cr>
" nnoremap <LocalLeader>v <plug>(vimtex-view)
" This is for math
" Open the math cls file for editing
nnoremap <LocalLeader>em :vs ~/texmf/tex/latex/math/math.sty<cr>
" Open a downloaded reference file
nnoremap <LocalLeader>er :! see ~/texmf/tex/latex/ref//&<Left><BS>
" Open the snippets files *and* the math cls file for editing
nnoremap <LocalLeader>es :vs ~/.config/nvim/plugged/vim-snippets/UltiSnips/tex.snippets<cr>:sp ~/.config/nvim/plugged/vim-snippets/UltiSnips/texmath.snippets<cr>:sp ~/.config/nvim/UltiSnips/tex.snippets<cr>:sp ~/texmf/tex/latex/math/math.sty<cr><c-w>_
"nnoremap <buffer> <LocalLeader>M :call ForceMake()<cr>
"unmap <LocalLeader>m

" For the tex-conceal package
set conceallevel=2

" Abbreviations

" Remove underscore from keywords. This makes typing math easier.
setlocal iskeyword-=_

" Greek letters
" iabbrev <buffer> alph α
" iabbrev <buffer> beta β
" iabbrev <buffer> delt δ
" iabbrev <buffer> Delt Δ
" iabbrev <buffer> gam γ
" iabbrev <buffer> Gam Γ
" " EPSilon and Lunate EPSilon
" iabbrev <buffer> eps ε
" iabbrev <buffer> leps ϵ
" iabbrev <buffer> zet ζ
" iabbrev <buffer> eta η
" iabbrev <buffer> tau τ
" iabbrev <buffer> thet θ
" iabbrev <buffer> kap κ
" iabbrev <buffer> iot ι
" iabbrev <buffer> lam λ
" iabbrev <buffer> Lam Λ
" iabbrev <buffer> mu μ
" iabbrev <buffer> pi π
" iabbrev <buffer> psi ψ
" iabbrev <buffer> Psi Ψ
" iabbrev <buffer> phi φ
" iabbrev <buffer> ghi ϕ
" iabbrev <buffer> Phi Φ
" iabbrev <buffer> sig σ
" iabbrev <buffer> Sig Σ
" iabbrev <buffer> xi ξ
" iabbrev <buffer> Xi Ξ
" iabbrev <buffer> rho ρ
" iabbrev <buffer> om ω
" iabbrev <buffer> Om Ω
" iabbrev <buffer> chi χ

" Subsets / Supersets
iabbrev <buffer> subs  ⊆
iabbrev <buffer> subsa ⊂
iabbrev <buffer> nsubs ⊈
iabbrev <buffer> subsn ⊊

iabbrev <buffer> sups  ⊇
iabbrev <buffer> supsa ⊃
iabbrev <buffer> nsups ⊉
iabbrev <buffer> supsn ⊋

iabbrev <buffer> opl ⊕


"TODO: add varphi
"TODO: add varpi

function! ForceMake()
  let oldmakeprg = &l:makeprg
  try
    " set new value of makeprg and call the function
    set makeprg=latexmk\ -gg\ -pdf\ %
    make
  finally
    " set makeprg back to old value
    let &l:makeprg = oldmakeprg
  endtry
endfunction

