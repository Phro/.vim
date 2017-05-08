"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"       This build by Jesse Frohlich
"
" Version:
"       5.0 - 29/05/12 15:43:36
"
" Blog_post:
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version:
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> Vim-plug configuration
"    -> General
"    -> NeoComplete configuration settings
"    -> VIM user interface
"    -> Colors and fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs, windows, and buffers
"    -> Status line
"    -> Editing mappings
"    -> Vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Vim-Plugin Configuration
    set nocompatible
    let g:plug_shallow=0
    let g:plug_threads=2
    call plug#begin('~/.config/nvim/plugged')

    " Autocompletions
    "Plug 'Shougo/neocomplete.vim'
    "Plug 'Shougo/neocomplete.vim'

    " One theme
    Plug 'rakr/vim-one'

    " Comment handling keymaps
    Plug 'phro/nerdcommenter'

    " Haskell expansion
    Plug 'neovimhaskell/haskell-vim'

    " Fugitive: Git-handling commands
    Plug 'tpope/vim-fugitive'

    " Set $EDITOR to current neovim instance.
    Plug 'rliang/termedit.nvim'

    " Auto-close quotes, parentheses, etc. (find a way to fix the undo using
    " the vim-repeat plugin)
    "Plug 'Townk/vim-autoclose'

    " Add a command for renaming files
    Plug 'danro/rename.vim'

    " LaTeX collection of useful commands
    "Plug 'LaTeX-Box-Team/LaTeX-Box'

    " Surround objects with quotes, parentheses, etc.
    Plug 'tpope/vim-surround'
    " Intelligent date in/de-crementation' with <C-A>/<C-X>
    Plug 'tpope/vim-speeddating'
    " Intelligent repeating for the above 2 plugins
    Plug 'tpope/vim-repeat'

    " Undo last closed window
    Plug 'AndrewRadev/undoquit.vim'

    " A plugin called 'easymotion' sounds like a great way to move around
    " in-screen.

    " Extra Color-schemes
    "Plug 'flazz/vim-colorschemes'
    
    " Solarized theme
    "Plug 'altercation/vim-colors-solarized'
    Plug 'lifepillar/vim-solarized8'

    " Color table viewer
    "Plug 'guns/xterm-color-table.vim'
    " smart Status Line:
    Plug 'bling/vim-airline'

    " Make sure you use single quotes
    "Plug 'junegunn/seoul256.vim'
    "Plug 'junegunn/vim-easy-align'

    " Group dependencies, vim-snippets depends on ultisnips
    "Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

    " On-demand loading
    "Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
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

" => General
    " Detect filetypes by their extension and syntax
    filetype plugin indent on
    syntax enable


    "let $EDITOR = '~/bin/e'

    set shell=zsh

    " Sets how many lines of history VIM has to remember
    set history=700

    " Set to auto read when a file is changed from the outside
    set autoread

    " Set the window title to the current file being edited.
    set title

    " Set the leader to space (backslash will still work).
    "map <Space> <Leader>
    "nnoremap <Space> <Nop>
    "let mapleader = "\<space>"
    map <Space> <Leader>

    " Fast saving, somewhat nulled by the following autosave:
    "nnoremap <LocalLeader>w :w!<cr>

    " Autosave after leaving insert mode and making a change in normal mode
    autocmd InsertLeave * silent! update
    autocmd TextChanged * silent! update

    " This should fix the strange delay occurring in when the escape (^[) key is pressed.
    set ttimeout
    set ttimeoutlen=0
    set notimeout

" => Vim User Interface
    " Set 4 lines to the cursor - when moving vertically using j/k
    set so=4

    " Turn on the WiLd menu
    set wildmenu
    "set wildmode=list:longest

    " Ignore compiled files
    set wildignore=*.o,*~,*.pyc

    "Always show current position
    set ruler

    " Height of the command bar
    set cmdheight=1

    " A buffer becomes hidden when it is abandoned
    set hid

    " Configure backspace so it acts as it should act
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l

    " Ignore case when searching
    set ignorecase

    " When searching try to be smart about cases
    set smartcase

    " Would it be possible to enable all searches to use the \Z flag (i.e.,
    " make searches blind to accents and umlauts (e.g. ü, á)?

    " Highlight search results
    set hlsearch
    nohlsearch

    " Makes search act like search in modern browsers
    set incsearch

    " Don't redraw while executing macros (good performance config)
    set lazyredraw

    " For regular expressions turn magic on
    set magic

    " Show matching brackets when text indicator is over them
    set showmatch
    " How many tenths of a second to blink when matching brackets
    set mat=1

    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set noerrorbells visualbell t_vb=
    set t_vb=
    set tm=500

    " Decrease the length of many prompts:
    set shortmess=atI

" => Colors and Fonts

    set termguicolors
    let g:solarized_term_italics = 1

    " If you want a transparent editor
    "let g:solarized_termtrans=1

    "colorscheme one
    colorscheme solarized8_dark
    "colorscheme solarized8_light


    " Set the colorscheme based on the time of day. Between 06:00 and 18:00
    " it is light, otherwise, it's dark. However, this is super annoying.
    "let time = strftime("%H") 
    "if 5 < time && time < 19
      "exe "colorscheme" substitute(g:colors_name, 'dark', 'light', '')
    "else
      "exe "colorscheme" substitute(g:colors_name, 'light', 'dark', '')
    "endif

    "nnoremap <Leader>as :call ChangeBackground()<cr>
    nnoremap <Leader>as :<c-u>exe "colors" (g:colors_name =~# "dark"
    \ ? substitute(g:colors_name, 'dark', 'light', '')
    \ : substitute(g:colors_name, 'light', 'dark', '')
    \ )<cr>


    noremap <localleader>- :call Solarized8Contrast(-v:count1)<cr>
    noremap <localleader>_ :call Solarized8Contrast(+v:count1)<cr>

    function! Solarized8Contrast(delta)
      let l:schemes = map(["_low", "_flat", "", "_high"], '"solarized8_".(&background).v:val')
      exe "colors" l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 4 + 4) % 4]
      echom g:colors_name
    endfunction


    " Expand spell-checking to multiple languages (Be careful with this...)
    set spelllang=en
    "set spelllang=en,es,de

    " Use Unix as the standard file type
    set ffs=unix,dos,mac

    " Resolve an issue with autocompletion YCM
    "let g:clang_user_options='|| exit 0'

    " => Filetypes, backups and undo
    " Turn backup off, since most stuff is in SVN, git et.c anyway...
    set nobackup
    set nowb
    set noswapfile

    " New filetype detection
    augroup filetypedetect
      " Asymptote
      au BufRead,BufNewFile *.asy setfiletype asy
    augroup end

    augroup terminal
      " No spellcheck in terminals
      autocmd TermOpen * setlocal nospell
      " Automatically enter insert mode when entering terminal buffers
      autocmd BufEnter * if &l:buftype ==# 'terminal' | startinsert | endif
    augroup END

    " Open a terminal at the bottom
    noremap <localleader>tt :belowright 5split +term<cr>

" => Text, Tab and Indent Related
    " Use spaces instead of tabs
    set expandtab

    " Be smart when using tabs ;)
    set smarttab

    " 1 tab == 2 spaces
    set shiftwidth=2
    set tabstop=2

    " Linebreak more cleanly
    set lbr
    set wrap " Wrap lines
    set tw=0 " Set this to a non-null number for *non*-TeX files

    set ai " Auto indent
    set si " Smart indent

		" Copy to clipboard
		vnoremap  <leader>y  "+y
		nnoremap  <leader>Y  "+yg_
		nnoremap  <leader>y  "+y
		nnoremap  <leader>yy  "+yy

		" Paste from clipboard
		nnoremap <leader>p "+p
		nnoremap <leader>P "+P
		vnoremap <leader>p "+p
		vnoremap <leader>P "+P

" => Visual mode related
    " Visual mode pressing * or # searches for the current selection
    " Super useful! From an idea by Michael Naumann
    vnoremap <silent> * :call VisualSelection('f')<CR>
    vnoremap <silent> # :call VisualSelection('b')<CR>

" => Moving around, tabs, windows, and buffers
    " Treat long lines as break lines (useful when moving around in them)
    noremap j gj
    noremap k gk
    noremap gj j
    noremap gk k
    noremap ' `
    noremap ` '
    " Escape exits terminal
    tnoremap <Esc> <C-\><C-n>
    vnoremap // y/<C-R>"<CR>

    " Make the mouse more useful in vim
    set mouse=a

    " By default, open new windows to the right.
    set splitright

    " Deactivate search highlighting until the next search
    noremap <silent> <LocalLeader><cr> :noh<cr>

    " Smart way to move between windows
    noremap <C-j> <C-W>j
    noremap <C-k> <C-W>k
    noremap <C-h> <C-W>h
    noremap <C-l> <C-W>l

    " As cute as this is, don't use it.
    "inoremap <C-h> <c-o><C-W>h
    "inoremap <C-l> <c-o><C-W>l
    tnoremap <C-h> <c-\><c-n><C-W>h
    tnoremap <C-l> <c-\><c-n><C-W>l
    tnoremap <C-j> <c-\><c-n><C-W>j
    tnoremap <C-k> <c-\><c-n><C-W>k
    tnoremap <c-o> <c-\><c-n>

    " More accesible than the control key:
    noremap <Leader>h <C-W>h
    noremap <Leader>l <C-W>l
    noremap <Leader>j <C-W>j
    noremap <Leader>k <C-W>k

    noremap <Leader>H <C-w>H
    noremap <Leader>L <C-w>L
    noremap <Leader>J <C-w>J
    noremap <Leader>K <C-w>K

    noremap <Leader>d :q<cr>

    "noremap y+ :%y+<cr>

    " NOTE: the function <C-W>i searches for the first occurrence of a variable
    " in a file (i.e. it's first declaration / definition). However, this search
    " is smart-cased (by the settings laid out in this .vimrc). A mod should be
    " introduced to change the case rules for this search to be case-sensitive,
    " since the majority of programming languages have case-sensitive variable
    " definitions.

    " Scroll through files quicker with option-j & option-k
    nnoremap ∆ 4<c-e>
    nnoremap ˚ 4<c-y>

    " Close the current buffer
    noremap <LocalLeader>bd :Bclose<cr>

    " Close all the buffers
    noremap <LocalLeader>ba :1,1000 bd!<cr>

    " Open alternate buffer (can be used to reopen a closed tab)
    noremap <LocalLeader>br :vs<Bar>:b#<CR>

    " Useful mappings for managing tabs:
    " NOTE: Either delete these or fix them and start using them.
    noremap <LocalLeader>tn :tabnew<cr>
    noremap <LocalLeader>to :tabonly<cr>
    noremap <LocalLeader>tc :tabclose<cr>
    noremap <LocalLeader>tm :tabmove

    " Opens a new tab with the current buffer's path
    " Super useful when editing files in the same directory
    noremap <LocalLeader>te :tabedit <c-r>=expand("%:p:h")<cr>/

    " Switch CWD to the directory of the open buffer
    noremap <LocalLeader>cd :cd %:p:h<cr>:pwd<cr>

    " Specify the behavior when switching between buffers
    try
      set switchbuf=useopen,usetab,newtab
      set stal=2
    catch
    endtry

    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
    " Remember info about open buffers on close
    set viminfo^=%

    " Custom folding script (fix so that this vimrc doesn't break :) )
    " Goals: This may be syntax-based, but include the closing brace (C-style)/
    " tag (xml) in a fold.
    " Note: Deactivate this for tex files.
    set foldmethod=expr
    set foldexpr=CustomFold(v:lnum)

    function! CustomFold(lnum)
        if getline(a:lnum,end) =~ '\v^\s*$'
            return '-1'
        endif

        let this_indent = IndentLevel(a:lnum)
        let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

        if next_indent <= this_indent
            return this_indent
        else
            return next_indent
        endif
    endfunction

    function! NextNonBlankLine(lnum)
        let numlines = line('$')
        let current = a:lnum + 1

        while current <= numlines
            if getline(current) =~ '\v\S'
                return current
            endif

            let current += 1
        endwhile

        return -2
    endfunction

    function! IndentLevel(lnum)
        return indent(a:lnum) / &shiftwidth
    endfunction

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

    noremap mt :call MoveToNextTab()<CR>
    noremap mT :call MoveToPrevTab()<CR>

 "=> Status line
    let g:airline_powerline_fonts=1
    "let g:airline#extensione'
    "let g:airline_theme='one'

    set laststatus=2

    set showcmd

    " Sets the current working directory to the location of the file bieng
    " edited. Wasn't there already something like this somewhere else, except
    " as a mapping?
    autocmd BufEnter * silent! lcd %:p:h

" => Editing mappings
    " Remap VIM 0 to first non-blank character. Do I really want this now that
    " it's really easy to reach the "^" key? I really need to deactivate the
    " numlock feature on this keyboard... :P
    noremap 0 ^

    " Swap ; and : in normal mode (and vise-versa)
    " Note: Or should this be implemented always?
    noremap ; :
    noremap : ;
    onoremap ; :
    onoremap : ;
    "set langmap=:\\;,\\;:

    " Remap p to paste to the current indentation, wheras ctrl-p maps to normal paste.
    noremap p ]p
    " May be overridden if CtrlP is introduced (a file/buffer editor/ viewer)
    noremap <C-P> p

    noremap <LocalLeader>o moo<Esc>`o
    noremap <LocalLeader>O moO<Esc>`o

    " This still must be fixed
    silent! call repeat#set("<LocalLeader>O", v:count)
    silent! call repeat#set("<LocalLeader>o", v:count)

    " Move lines upwards / downwards
    " Note: Perhaps use some insight from below?
    noremap - "ddd"dp
    noremap _ "dddk"dP

    " Make capital Y act as one would expect, but better
    noremap Y yg_
    " Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
    nnoremap <M-j> mz:m+<cr>`z
    nnoremap <M-k> mz:m-2<cr>`z
    vnoremap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
    vnoremap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

    if has("mac") || has("macunix") " If using a linux distribution with the same .vimrc, this is helpful
      nmap <D-j> <M-j>
      nmap <D-k> <M-k>
      vmap <D-j> <M-j>
      vmap <D-k> <M-k>
    endif

    noremap <LocalLeader>ts :call DeleteTrailingWS()<CR>

    " For git commit messages, limit line width.
    autocmd Filetype gitcommit setlocal spell textwidth=72

    " Delete trailing white space on save
    func! DeleteTrailingWS()
        " Add files from which you don't want to remove whitespace.
        "if &filetype =~ 'vim'
            "return
        "endif
        exe "normal! mz"
        %s/\s\+$//e
        exe "normal! `z"
    endfunc

    " Here, ideally git commands would no longer need a capital 'G', but I'm not quite sure how to enforce this.
    "cabbrev git <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Rename" : "rename"<CR>   autocmd BufWrite * call DeleteTrailingWS()

    " Maps <option-l> to <Esc>
    inoremap ¬ <Esc>

    " If <Esc> is used in a mapping here, then the command is executed (an old vi-compatability 'feature')
    cnoremap ¬ <c-c>
    noremap! ® <c-r>
    noremap ® <c-r>
    " Maps <option-w> to <ctrl-w> (Remove this once Caps-lock is remapped to ctrl)
    noremap ∑ <C-w>
    " Maps <option-f/b> to <ctrl-f/b> (Remove this once Caps-lock is remapped to ctrl)
    " (Page up-down)
    noremap ƒ <C-f>
    noremap ∫ <C-b>

    " Save and run the :make command
    nnoremap <LocalLeader>m :w!<cr>:make<cr>

    " Append a semicolon to the end of a line
    noremap <LocalLeader>; mqA;<Esc>`q
    " Go to the link under the cursor
    noremap gl ml"lyiW:!open <c-r>l<CR>`l
    " This could also be removed once ctrl is made more accesible. However, it
    " *does* match nicely with the already in place tab...
    noremap <S-Tab> <C-o>
    noremap <bs> <C-o>
    noremap <s-bs> <C-i>

    " Quickly edit ~/.vimrc (i.e. likely this file) with ' ev' and source it
    " with ' sv'
    nnoremap <LocalLeader>ev :tabedit $MYVIMRC<cr>
    nnoremap <LocalLeader>sv :source $MYVIMRC<cr>

    " Swap the default mappings (since 'append' is used more often here)
    map <Leader>ca <Plug>NERDCommenterAppend
    map <Leader>cA <Plug>NERDCommenterAltDelims
    " Non-toggling comment
    map <LocalLeader>co <Plug>NERDCommenterComment
    " Recursive comment
    map <LocalLeader>cr <Plug>NERDCommenterNested
    " More convenient comment toggle
    " noremap gc <Plug>NERDCommenterToggle

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

" => Vimgrep searching and cope displaying
    " When you press gv you vimgrep after the selected text
    vnoremap <silent> gv :call VisualSelection('gv')<CR>


    " When you press <LocalLeader>r you can search and replace the selected text
    vnoremap <silent> <LocalLeader>r :call VisualSelection('replace')<CR>

    " Do :help cope if you are unsure what cope is. It's super useful!
    "
    " When you search with vimgrep, display your results in cope by doing:
    "   <LocalLeader>cc
    "
    " To go to the next search result do:
    "   <LocalLeader>n
    "
    " To go to the previous search results do:
    "   <LocalLeader>p
    "
    nnoremap <Leader>cc :rightbelow cope<cr>
    " Navigate through quickfix windows
    "nnoremap <Leader>cn :cnewer<CR>
    "nnoremap <Leader>cp :colder<CR>
    "noremap <Leader>co :%y<cr>:tabnew<cr>:set syntax=qf<cr>pgg
    "noremap <Leader>n :cn<cr>
    "noremap <Leader>p :cp<cr>

" => Spell checking

    " Start vim with automatic spell checking. Move this line into local files
    " (esp. for .csv, .tex, etc.)
    set spell

    " Pressing ,ss will toggle spell checking
    noremap <Leader>ss :setlocal spell!<cr>

    " Shortcuts using <Leader>
    noremap <Leader>sn ]s
    noremap <Leader>sp [s
    noremap <Leader>sa zg
    noremap <Leader>s? z=

" => Misc
    " Remove the Windows ^M - when the encodings gets messed up
    "noremap <LocalLeader>mw mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

    " Quickly open a buffer for scribble
    noremap <LocalLeader>qb :e ~/buffer<cr>
    " Quickly (attempt to) quit vim
    noremap <LocalLeader>qq :qall<CR>
    " Save the current vim session and quit (warn if there are unsaved changes).
    noremap <LocalLeader>qs :mksession!<CR>:qall<CR>

    " Toggle paste mode on and off
    noremap <LocalLeader>wp :setlocal paste!<cr>

    " This fantastic vim-sed will take a title and capitalize all words that are
    " at least 3 characters long!
    " 'Add Title'-case to the current line
    noremap <silent> <LocalLeader>at guu:call setline(line('.'),substitute(getline('.'), '\v<(.)(\w{3,})', '\u\1\L\2', 'g'))<CR>

    " Underline the current line (with dashes "u", or equals "U").
    noremap <LocalLeader>au yypVr-
    noremap <LocalLeader>aU yypVr=

    " The following may not be that useful...
    " 'add date' after the cursor.
    "noremap <LocalLeader>ad a<C-R>=strftime("%Y-%m-%d")<CR><Esc>
    " 'ad name' after the cursor
    noremap <LocalLeader>an aJesse Frohlich<Esc>

" => Helper functions
    function! ChangeBackground()
      if &background == "dark"
        set background=light
      else
        set background=dark
      endif
    endfunction

    function! CmdLine(str)
      exe "menu Foo.Bar :" . a:str
      emenu Foo.Bar
      unmenu Foo
    endfunction

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


    " Returns true if paste mode is enabled
    function! HasPaste()
        if &paste
            return 'PASTE MODE  '
        en
        return ''
    endfunction

    " Don't close window, when deleting a buffer
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
