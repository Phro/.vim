" Summary: {{{1
" Maintainer: Jesse Frohlich
" Version: 1.1.1 (2022-06-02)

" Vim Plug: {{{1
" Boilerplate: {{{2
set nocompatible
let g:plug_shallow=0
" let g:plug_threads=4
call plug#begin('~/.config/nvim/plugged')
" Plugins: {{{2
" Editor Specific: {{{3
" Auto Closing: quotes, parentheses, etc. {{{4
Plug 'jiangmiao/auto-pairs'
" Autocompletion: {{{4
if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi', {'for':'python'}
" Autosave: {{{4
Plug '907th/vim-auto-save'
" Browser-embedding plugins: {{{4
Plug 'glacambre/firenvim', {'do': { _ -> firenvim#install(0) }}
" Colorscheme: {{{4
Plug 'frankier/neovim-colors-solarized-truecolor-only'
" Colorizing: {{{4
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Comment-Handling Keymaps: {{{4
Plug 'phro/nerdcommenter'
" Entering Unicode: {{{4
Plug 'chrisbra/unicode.vim'
" Emoji Support: {{{4
Plug 'bew/deoplete-emoji-backup'
" Expand 'ga': {{{4
Plug 'tpope/vim-characterize'
" Git: {{{4
" Fugitive: {{{5
Plug 'tpope/vim-fugitive'
" Git Gutter: (Display unstaged changes) {{{5
Plug 'airblade/vim-gitgutter'
" Intelligent Dates: in/de-crementation with <C-A>/<C-X> {{{4
Plug 'tpope/vim-speeddating'
" Intelligent Repeating: for 'speeddating' & 'surround' {{{4
Plug 'tpope/vim-repeat'
" LSP Configuration: {{{4
" Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Rename Files: {{{4
Plug 'danro/rename.vim'
" Set $EDITOR to current neovim instance: {{{4
" TODO: set editor to edit vim files (almost)
" always in the same instance.
Plug 'rliang/termedit.nvim'
" Snippets: Ultisnips {{{4
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Status Line: {{{4
" TODO: customize to the information I care about.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Surround Objects: with quotes, parentheses, etc. {{{4
Plug 'tpope/vim-surround'
" Undo Last Closed Window: {{{4
" TODO: do you actually use this? No.
" TODO: does this actually work?
Plug 'AndrewRadev/undoquit.vim'
" Language Specific: {{{3
" Dhall: {{{4
Plug 'vmchale/dhall-vim'
" Haskell: {{{4
" Display symbols prettily
" Plug 'Twinside/vim-haskellConceal'
" Expansion, highlighting, and indentation
Plug 'neovimhaskell/haskell-vim'
" LaTeX Support: Vimtex {{{4
Plug 'lervag/vimtex', {'for': 'tex'} | Plug 'KeitaNakamura/tex-conceal.vim'
" Markdown Syntax: {{{4
" TODO: This is still not adequate,
Plug 'gabrielelana/vim-markdown'
" Mathematica: {{{4
Plug 'voldikss/vim-mma'
" YAML Syntax Highlighting: {{{4
" TODO: find / create one which handles muliline strings with colons.
" This is also an indentation issue, which has less to do with
" syntax-highlighting.
Plug 'stephpy/vim-yaml'
" Vim Plug Examples: {{{3

" On-demand loading
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Add plugins to &runtimepath
call plug#end()

" Must come after plugins (TODO: verify this):
" Detect filetypes by their extension and syntax
" filetype plugin indent on
" syntax enable}}}
" Plugin Settings: {{{2
" Editor Specific: {{{3
" Autosave: vim-auto-save {{{4
" Fast saving, somewhat nulled by the following autosave: {{{5
nnoremap <LocalLeader>w :w!<cr>
nnoremap <LocalLeader>Wt :AutoSaveToggle<cr>
" Autosave after leaving insert mode and making a change in normal mode {{{5
let g:auto_save = 1
let g:auto_save_silent = 1
" Colorizing: {{{4
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'
" Deoplete: {{{4
" Enable at startup {{{5
let g:deoplete#enable_at_startup = 1
" Use smartcase. {{{5
call deoplete#custom#option({'smart_case': v:true})
" Play well with backspace {{{5
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
" <cr>: close popup and save indent. {{{5
inoremap <silent> <cr> <C-r>=<SID>my_cr_function()<cr>
function! s:my_cr_function() abort
        return deoplete#close_popup() . "\<cr>"
endfunction
" tab-complete instead of just <c-n> {{{5
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Expand 'ga' {{{4
nmap ga <Plug>(UnicodeGA)
" gitgutter {{{4
set updatetime=100
" LSP Configuration: {{{4
" lua require'lspconfig'.hls.setup{}
" NERDcommenter: {{{4
" Add a space after the opening delimiter of a comment. {{{5
let g:NERDSpaceDelims=1
" Enable trimming of trailing whitespace when uncommenting {{{5
let g:NERDTrimTrailingWhitespace = 1
" Let NERDCommenterToggle check if all selected lines are commented {{{5
let g:NERDToggleCheckAllLines = 1
" Swap the default mappings (since 'append' is used more often here) {{{5
map <Leader>ca <Plug>NERDCommenterAppend {{{5
map <Leader>cA <Plug>NERDCommenterAltDelims
" Non-toggling comment {{{5
map <LocalLeader>co <Plug>NERDCommenterComment
" Recursive comment {{{5
map <LocalLeader>cr <Plug>NERDCommenterNested
" Repeat commands {{{5
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
silent! call repeat#set("\<Plug>NERDCommenterAppend", v:count)
silent! call repeat#set("\<Plug>NERDCommenterUncomment", v:count)
silent! call repeat#set("\<Plug>NERDCommenterUncomment", v:count)
silent! call repeat#set("\<Plug>NERDCommenterAlignBoth", v:count)
silent! call repeat#set("\<Plug>NERDCommenterAlignBoth", v:count)
silent! call repeat#set("\<Plug>NERDCommenterAlignLeft", v:count)
silent! call repeat#set("\<Plug>NERDCommenterAlignLeft", v:count)
silent! call repeat#set("\<Plug>NERDCommenterAltDelims", v:count)
silent! call repeat#set("\<Plug>NERDCommenterYank", v:count)
silent! call repeat#set("\<Plug>NERDCommenterYank", v:count)
silent! call repeat#set("\<Plug>NERDCommenterSexy", v:count)
silent! call repeat#set("\<Plug>NERDCommenterSexy", v:count)
silent! call repeat#set("\<Plug>NERDCommenterInvert", v:count)
silent! call repeat#set("\<Plug>NERDCommenterInvert", v:count)
silent! call repeat#set("\<Plug>NERDCommenterToEOL", v:count)
silent! call repeat#set("\<Plug>NERDCommenterNested", v:count)
silent! call repeat#set("\<Plug>NERDCommenterNested", v:count)
silent! call repeat#set("\<Plug>NERDCommenterMinimal", v:count)
silent! call repeat#set("\<Plug>NERDCommenterMinimal", v:count)
silent! call repeat#set("\<Plug>NERDCommenterToggle", v:count)
silent! call repeat#set("\<Plug>NERDCommenterToggle", v:count)
silent! call repeat#set("\<Plug>NERDCommenterComment", v:count)
" Vim Airline: {{{4
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ' C:'
let g:airline_symbols.linenr = ' L:'
let g:airline_symbols.maxlinenr = ''
" Ultisnips: {{{4
"let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"
let g:UltiSnipsEditSplit="context"
" Emoji: {{{4
" Automatically convert emoji-codes to their unicode representation {{{5
call deoplete#custom#source('emoji', 'converters', ['converter_emoji'])
" Allow emoji in all filetypes
" Note: consider removing TeX from this list. {{{5
call deoplete#custom#source('emoji', 'filetypes', [])
" Language Specific: {{{3
" Vimtex: {{{4
let g:vimtex_view_method = 'zathura'
let g:vimtex_delim_toggle_mod_list = [
        \ ['\bigl', '\bigr'],
        \ ['\Bigl', '\Bigr'],
        \ ['\biggl', '\biggr'],
        \ ['\Biggl', '\Biggr'],
        \]
let g:vimtex_quickfix_mode = 0

nnoremap <LocalLeader>v <plug>(vimtex-view)
nnoremap <c-S> <plug>(vimtex-delim-toggle-modifier)
nnoremap <c-s-S> <plug>(vimtex-delim-toggle-modifier-reverse)
let g:vimtex_compiler_latexmk = {
                \ 'backend' : 'nvim',
                \ 'options' : [
                \        '-pdflatex',
                \        '-file-line-error',
                \        '-synctex=1',
                \        '-interaction=nonstopmode',
                \       ],
                \}
" Markdown: vim-markdown {{{4
let g:markdown_enable_conceal = 1
let g:markdown_enable_mappings = 0
let g:markdown_include_jekyll_support = 0
" vim-mathematica {{{4
let g:mma_highlight_option = "solarized"
let g:mma_candy = 1
" General: {{{1
set shell=zsh
" Automatically read a file when it is changed from the outside {{{2
set autoread
" Set the window title to the current file being edited. {{{2
set title
" Line numbering {{{2
set number
set relativenumber
" Set the number column width to at least two (default: 4) {{{2
set numberwidth=2
" Set the leader to space {{{2
" Note: Backslash (the default leader) will still work
map <Space> <Leader>
" Reduce timeout length {{{2
" This should fix the strange delay occurring in when the escape (^[) key
" is pressed.
set ttimeout
set ttimeoutlen=0
set notimeout
" Set pwd to location of file of current window {{{2
set autochdir
" Vim User Interface: {{{2
" Keep 4 lines around the cursor at all times {{{3
set scrolloff=4
" Set wildmode to complete to the next common match {{{3
set wildmode=list:longest
set wildignorecase
" Ignore compiled files {{{3
set wildignore=*.o,*~,*.pyc
" Height of the command bar. {{{3
" If you have space, you may wish this to be larger to avoid hit-enter
" prompts.
set cmdheight=1
" A buffer becomes hidden when it is abandoned {{{3
set hid
" Configure backspace so it acts as it should act {{{3
set backspace=eol,start,indent
" Allow arrowkeys and h and l to move between lines when at extreme ends. {{{3
set whichwrap+=<,>,h,l
" When searching, try to be smart about cases {{{3
set ignorecase
set smartcase
" Dream: Would it be possible to enable all searches to use the
" \Z flag (i.e., make searches blind to accents and umlauts
" (e.g. ü, á)?
" Highlight search results only while searching {{{3
augroup vimrc-incsearch-highlight
        autocmd!
        autocmd CmdlineEnter /,\? :set hlsearch
        autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
" Toggle search highlighting if desired {{{3
noremap <silent> <LocalLeader><cr> :set hlsearch!<cr>
" Makes search act like search in modern browsers {{{3
set incsearch
" Show matching brackets when text indicator is over them {{{3
set showmatch
" How many tenths of a second to blink when matching brackets {{{3
set matchtime=1
" No annoying sound on errors {{{3
" set noerrorbells
" set novisualbell
" set noerrorbells visualbell t_vb=
" set t_vb=
" }}}3
set timeoutlen=500
" Decrease the length of many prompts: {{{3
set shortmess=atI
" Colors: {{{1
" Set dark solarized theme {{{2
set background=dark
set termguicolors
colorscheme solarized
" Coc highlight color {{{2

" Toggle background color {{{2
nnoremap <Leader>as :call ToggleBackground()<cr>
" Copied from solarized's togglebg.vim {{{2
function! ToggleBackground()
        let &background = ( &background == "dark"? "light" : "dark" )
        if exists("g:colors_name")
                        exe "colorscheme " . g:colors_name
        endif
endfunction
" Toggle Hexokinase (color display) [Show Colors] {{{2
noremap <localleader>sc :HexokinaseToggle<cr>
" Filetypes, backups and undo: {{{1
        " Turn backup off, since most stuff is in SVN, git et.c anyway... {{{2
                set nobackup
                set nowb
                set noswapfile
        " New filetype detection {{{2
                augroup filetypedetect
                        " Asymptote
                                au BufRead,BufNewFile *.asy setfiletype asy
                        " Sagemath
                                au BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype python
                augroup end
                autocmd FileType json syntax match Comment +//.\+$+
                " Interpret .m files as mathematica by default
                        let filetype_m = "mma"
                " Interpret .tex files as LaTeX by default
                        let g:tex_flavor='latex'
        augroup terminal
                " No spellcheck in terminals
                        autocmd TermOpen * setlocal nospell nonumber norelativenumber modifiable
                " Automatically enter insert mode when entering terminal buffers
                        autocmd BufEnter * if &l:buftype ==# 'terminal' | startinsert | endif
                        autocmd BufEnter term:// startinsert
                        autocmd TermOpen * startinsert
        augroup END
        " Open a terminal at the bottom {{{2
                noremap <localleader>tl :belowright 5split +term<cr>
                noremap <localleader>tv :vs +term<cr>
                noremap <localleader>tt :tabedit +term<cr>
        " For git commit messages, limit line width. {{{2
                autocmd Filetype gitcommit setlocal spell textwidth=72
        " Make <c-r> act like normal in a terminal. {{{2
                tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
" Text, Tab, and Indent Related {{{1
        " Append mac to the list of file formats (if such a file would be edited) {{{2
                set fileformats=unix,dos,mac
        " In the IBLLinearAlgebra directory, don't use expandtab {{{2
                autocmd BufEnter ~/ed/ta/223/wb/IBLLinearAlgebra/* setlocal noexpandtab
        " Use eight spaces instead of tabs in all contexts {{{2
                set expandtab
                set smarttab
                set shiftwidth=8
                set tabstop=8
        " SuperRetab function {{{2
                " TODO: add this command to a keymap or action hook.
                command! -nargs=1 -range SuperRetab
                        \ <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g
        " Whitespace highlighting {{{2
                nnoremap <leader>S :set list!<cr>
                set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
        " Linebreak more cleanly {{{2
                set lbr
                set wrap " Wrap lines
                set breakindent
                set textwidth=80
                set colorcolumn=+1,+2,+3
                let &showbreak= '-> '
        " Intelligent indenting {{{2
                set autoindent
                set smartindent
        " Make capital Y act as one would expect, but better {{{2
                noremap Y yg_
        " Copy to system clipboard {{{2
                vnoremap <leader>y "+y
                nnoremap <leader>Y "+yg_
                nnoremap <leader>y "+y
                nnoremap <leader>yy "+yy
        " Paste from clipboard {{{2
                nnoremap <leader>p "+p
                nnoremap <leader>P "+P
                vnoremap <leader>p "+p
                vnoremap <leader>P "+P
" Visual mode related {{{1
" Visual mode pressing * or # searches for the current selection {{{2
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<cr>
vnoremap <silent> # :call VisualSelection('b')<cr>
" Moving around, tabs, windows, and buffers {{{1
        " NOTE: the function <C-W>i searches for the first occurrence of a variable
        " in a file (i.e. it's first declaration / definition). However, this
        " search is smart-cased (by the settings laid out in this .vimrc). A mod
        " should be introduced to change the case rules for this search to be
        " case-sensitive, since the majority of programming languages have
        " case-sensitive variable definitions.
        " Treat long lines as break lines {{{2
                noremap j gj
                noremap gj j
                noremap k gk
                noremap gk k
        " Cause ' to return you to the exact cursor position, rather than ` {{{2
                noremap ' `
                noremap ` '
        " Escape exits terminal {{{2
                tnoremap <Esc> <C-\><C-n>
                vnoremap // y/<C-R>"<cr>
        " Enable the mouse in vim (disable with shift) {{{2
                set mouse=a
        " By default, open new windows to the right. {{{2
                set splitright
        " Smart way to move between windows {{{2
                noremap <a-S-J> <C-w>J
                noremap <a-S-K> <C-w>K
                noremap <a-S-H> <C-w>H
                noremap <a-S-L> <C-w>L

                " TODO: test the terminal usefulness
                tnoremap <a-S-J> <C-w>J
                tnoremap <a-S-K> <C-w>K
                tnoremap <a-S-H> <C-w>H
                tnoremap <a-S-L> <C-w>L

                noremap <C-j> <C-w>j
                noremap <C-k> <C-w>k
                noremap <C-h> <C-w>h
                noremap <C-l> <C-w>l

                noremap <a-j> <C-w>j
                noremap <a-k> <C-w>k
                noremap <a-h> <C-w>h
                noremap <a-l> <C-w>l

                " TODO: test the terminal usefulness
                tnoremap <a-j> <c-\><c-n><C-w>j
                tnoremap <a-k> <c-\><c-n><C-w>k
                tnoremap <a-h> <c-\><c-n><C-w>h
                tnoremap <a-l> <c-\><c-n><C-w>l

                tnoremap <C-h> <c-\><c-n><C-W>h
                tnoremap <C-l> <c-\><c-n><C-W>l
                tnoremap <C-j> <c-\><c-n><C-W>j
                tnoremap <C-k> <c-\><c-n><C-W>k
                tnoremap <c-o> <c-\><c-n>

                noremap <Leader>H <C-w>H
                noremap <Leader>L <C-w>L
                noremap <Leader>J <C-w>J
                noremap <Leader>K <C-w>K
        " Close windows with one fewer keystroke {{{2
                noremap <Leader>d :q<cr>
                noremap <Leader>D :bdelete<cr>
        " Buffer maps {{{2
                " Close the current buffer
                        noremap <LocalLeader>bd :Bclose<cr>
                " Close all the buffers
                        noremap <LocalLeader>ba :1,1000 bd!<cr>
                " Open alternate buffer (can be used to reopen a closed tab)
                        noremap <LocalLeader>br :vs<Bar>:b#<cr>
        " Useful mappings for managing tabs: {{{2
                noremap <LocalLeader>tn :tabnew<cr>
                noremap <LocalLeader>tc :tabclose<cr>
                noremap <LocalLeader>tm :-tabmove<cr>
                noremap <LocalLeader>tM :+tabmove<cr>
        " Open a new tab with the current buffer's path {{{2
                " Super useful when editing files in the same directory
                noremap <LocalLeader>te :tabedit <c-r>=expand("%:p:h")<cr>/
        " Specify the behavior when switching between buffers {{{2
                try
                        set switchbuf=useopen,usetab,newtab
                        set showtabline=2
                catch
                endtry
        " Return to last edit position when opening files (You want this!) {{{2
                autocmd BufReadPost *
                        \ if line("'\"") > 0 && line("'\"") <= line("$") |
                        \ exe "normal! g`\"" |
                        \ endif
        " Remember info about open buffers on close {{{2
                set shada^=%
        " }}}2
        function! MoveToPrevTab()
                "there is only one window
                if tabpagenr('$') == 1 && winnr('$') == 1
                        return
                endif
                "preparing new window
                let l:tab_nr = tabpagenr('$')
                let l:cur_buf = bufnr('%')
                if tabpagenr() != 1
                        close!
                        if l:tab_nr == tabpagenr('$')
                                tabprev
                        endif
                        sp
                else
                        close!
                        exe "0tabnew"
                endif
                "opening current buffer in new window
                exe "b".l:cur_buf
        endfunc

        function! MoveToNextTab()
                " there is only one window
                if tabpagenr('$') == 1 && winnr('$') == 1
                        return
                endif
                "preparing new window
                let l:tab_nr = tabpagenr('$')
                let l:cur_buf = bufnr('%')
                if tabpagenr() < tab_nr
                        close!
                        if l:tab_nr == tabpagenr('$')
                                tabnext
                        endif
                        sp
                else
                        close!
                        tabnew
                endif
                " opening current buffer in new window
                exe "b".l:cur_buf
        endfunc

        noremap mt :call MoveToNextTab()<cr>
        noremap mT :call MoveToPrevTab()<cr>
" Status line {{{1
        " Always show a status line for every window  {{{2
        set laststatus=2
        " Only show the tabline if there are multiple tabs {{{2
        set showtabline=1
        set showcmd
" Editing mappings {{{1
        " Swap go-to's for beginning of line and beginning of non-whitespace line. {{{2
                noremap 0 ^
                noremap ^ 0
        " Swap ; and : in normal mode (and vice-versa) {{{2
                " Note: Or should this be implemented always?
                noremap ; :
                noremap : ;
                onoremap ; :
                onoremap : ;
                "set langmap=:\\;,\\;:
        " p pastes to current indentation, whereas <c-p> pastes exactly. {{{2
                noremap p ]p
                noremap <C-p> p
        " Insert lines above or below current line. {{{2
                noremap <LocalLeader>O moO<Esc>`o
                noremap <LocalLeader>o moo<Esc>`o
        " This still must be fixed {{{2
                silent! call repeat#set("<LocalLeader>O", v:count)
                silent! call repeat#set("<LocalLeader>o", v:count)
        " Move line(s) of text using ALT+[jk] or Comamnd+[jk] on mac {{{2
                " TODO: if desired, also add '-' and '_' mappings
                nnoremap - mz:m+<cr>`z
                nnoremap _ mz:m-2<cr>`z
                vnoremap - :m'>+<cr>`<my`>mzgv`yo`z
                vnoremap _ :m'<-2<cr>`>my`<mzgv`yo`z
        " Clean up extraneous whitespace {{{2
                " Note: Good regex for removing superfluous spaces: be careful for table
                " alignment in, say TeX documents: \v([^ ]@<=) +
                noremap <LocalLeader>ts :call DeleteTrailingWS()<cr>
                noremap <LocalLeader>tS :call DeleteInternalWS()<cr>
                noremap <LocalLeader>T :call DeleteInternalWS()<cr>
                func! DeleteTrailingWS()
                                " Add files from which you don't want to remove whitespace.
                                " if &filetype =~ 'vim'
                                                " return
                                " endif
                                exe "normal! mz"
                                %s/\s\+$//e
                                " %s/\v(\.)@<=\s{2,}/ /e
                                exe "normal! `z"
                endfunc
                func! DeleteInternalWS()
                                " Add files from which you don't want to remove whitespace.
                                "if &filetype =~ 'vim'
                                                "return
                                "endif
                                exe "normal! mz"
                                %s/\v[^ ]@<= {2,}/ /ge
                                exe "normal! `z"
                endfunc
        " Don't insert two spaces after a '.', '!', or '?' {{{2
                set nojoinspaces
        " Save and run the :make command {{{2
                nnoremap <LocalLeader>m :w!<cr>:make<cr>
        " Go to the link under the cursor (browser-dependant) {{{2
                noremap gl ml"lyiW:!vimb <c-r>l<cr>`l
        " Use backspace to move through jumplist {{{2
                " This could also be removed once ctrl is made more accesible. However, it
                " *does* match nicely with the already in place tab...
                noremap <S-Tab> <C-o>
                noremap <bs> <C-o>
                noremap <s-bs> <C-i>
        " Quick access to config files {{{2
                " Edit and source this file and edit current filetype settings.
                nnoremap <Leader>ef :call EditFiletype()<cr>
                nnoremap <Leader>es :UltiSnipsEdit<cr>
                nnoremap <Leader>ev :tabedit $MYVIMRC<cr>
                nnoremap <Leader>sv :source $MYVIMRC<cr>

                function! EditFiletype()
                        let configdir = fnamemodify(expand("$MYVIMRC"),":p:h")
                        execute ":tabedit" . configdir . "/ftplugin/" . &filetype .".vim"
                endfunction
        " Open a quick buffer with currently defined mappings {{{2
                nnoremap <Leader>sm :call SeeMap(0)<cr>
                nnoremap <Leader>sM :call SeeMap(1)<cr>
                function! SeeMap(verbose)
                        let l:filepath = "/tmp/vim-map-keys"
                        execute "redir! > " . l:filepath
                        execute "silent " . (a:verbose==1? "verbose":"") . " map"
                        execute "redir END"
                        execute "silent belowright 10split " . l:filepath
                endfunction
" Vimgrep searching and cope displaying {{{1
        " When you press gv you vimgrep after the selected text {{{2
                vnoremap <silent> gv :call VisualSelection('gv')<cr>
        " When running :s(ubstitute), show incremental changes. {{{2
                set inccommand=split
        " Search and replace selected text (FIXME: non-functional!) {{{2
                vnoremap <silent> <LocalLeader>r :call VisualSelection('replace')<cr>
        " Quickfix TODO: clean up {{{2
                " Do :help cope if you are unsure what cope is. It's super useful!
                "
                " When you search with vimgrep, display your results in cope by doing:
                " <LocalLeader>cc
                "
                " To go to the next search result do:
                " <LocalLeader>n
                "
                " To go to the previous search results do:
                " <LocalLeader>p
                "
                nnoremap <Leader>cc :rightbelow cope<cr>
                " Navigate through quickfix windows
                "nnoremap <Leader>cn :cnewer<cr>
                "nnoremap <Leader>cp :colder<cr>
                "noremap <Leader>co :%y<cr>:tabnew<cr>:set syntax=qf<cr>pgg
                "noremap <Leader>n :cn<cr>
                "noremap <Leader>p :cp<cr>
" Spell-checking {{{1
        " Check spelling by default {{{2
                " Disable in specific filetype configs if desired (esp. for .csv, .tex, etc.)
                set spell
        " Expand spell-checking to multiple languages (Be careful with this...) {{{2
                set spelllang=en
                "set spelllang=en,es,de
        " Toggle spell checking {{{2
                noremap <Leader>ss :setlocal spell!<cr>
        " Shortcuts using <LocalLeader> {{{2
                noremap <LocalLeader>sn ]s
                noremap <LocalLeader>sp [s
                noremap <LocalLeader>sa zg
                noremap <LocalLeader>s? z=
" Misc {{{1
        " Redraw the screen {{{2
                noremap <LocalLeader>r :mode<cr>
        " Quickly (attempt to) quit vim {{{2
                noremap <LocalLeader>qq :qall<cr>
        " Save the current vim session and quit (warn if there are unsaved changes). {{{2
                noremap <LocalLeader>qs :mksession!<cr>:qall<cr>
        " Start a web server in the current directory. {{{2
                noremap <LocalLeader>aw :call jobstart('python -m http.server')<cr>
        " Toggle paste mode on and off {{{2
                noremap <LocalLeader>Wp :setlocal paste!<cr>
        " 'Add Title'-case to the current line {{{2
                " This fantastic vim-sed will take a title and capitalize all words that are
                " at least 3 characters long!
                noremap <silent> <LocalLeader>at guu:call setline(line('.'),
                                \ substitute(getline('.'), '\v<(.)(\w{3,})', '\u\1\L\2', 'g'))<cr>
        " Underline the current line (with dashes "u", or equals "U"). {{{2
                noremap <LocalLeader>au yypVr-
                noremap <LocalLeader>aU yypVr=
        " 'Add Date' at the cursor (not very useful) {{{2
                noremap <LocalLeader>ad a<C-R>=strftime("%Y-%m-%d")<cr><Esc>
        " Yank file name to unnamed register {{{2
                noremap <LocalLeader>gf :let @" = expand("%")<cr>
" Helper functions {{{1
" Visual selection function {{{2
        function! VisualSelection(direction) range
                        let l:saved_reg = @"
                        execute "normal! vgvy"

                        let l:pattern = escape(@", '\\/.*$^~[]')
                        let l:pattern = substitute(l:pattern, "\n$", "", "")

                        if a:direction == 'b'
                                        execute "normal ?" . l:pattern . "^M"
                        elseif a:direction == 'gv'
                                        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
                        elseif a:direction == 'replace'
                                        call CmdLine("%s" . '/'. l:pattern . '/')
                        elseif a:direction == 'f'
                                        execute "normal /" . l:pattern . "^M"
                        endif

                        let @/ = l:pattern
                        let @" = l:saved_reg
        endfunction
        function! CmdLine(str)
                exe "menu Foo.Bar :" . a:str
                emenu Foo.Bar
                unmenu Foo
        endfunction
        " Don't close window when deleting a buffer {{{2
                command! Bclose call <SID>BufcloseCloseIt()
                function! <SID>BufcloseCloseIt()
                         let l:currentBufNum = bufnr("%")
                         let l:alternateBufNum = bufnr("#")

                         if buflisted(l:alternateBufNum)
                                 buffer #
                         else
                                 bnext
                         endif

                         if bufnr("%") == l:currentBufNum
                                 new
                         endif

                         if buflisted(l:currentBufNum)
                                 execute("bdelete! ".l:currentBufNum)
                         endif
                endfunction
" vim: foldmethod=marker
