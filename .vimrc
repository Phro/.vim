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
"    -> Vundle Configuration
"    -> General
"    -> NeoComplete Configuration Settings
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs, windows, and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" => Vundle Configuration
    set nocompatible    " be iMproved, required
    filetype off         " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    " Autocompletions
    Plugin 'Shougo/neocomplete.vim'
    " Comment handling keymaps
    Plugin 'scrooloose/nerdcommenter'
    " Auto-close quotes, parentheses, etc. (find a way to fix the undo using
    " the vim-repeat plugin)
    Plugin 'Townk/vim-autoclose'
    " Add a command for renaming files
    Plugin 'danro/rename.vim'
    " Surround objects with quotes, parentheses, etc.
    Plugin 'tpope/vim-surround'
    " Intelligent date 'crementation' with <C-A>/<C-X>
    Plugin 'tpope/vim-speeddating'
    " Intelligent repeating for the above 2 plugins
    Plugin 'tpope/vim-repeat'

    "Plugin 'jordwalke/AutoComplPop.git'
    " Snippets Package:
    " Track the engine.
    "Plugin 'SirVer/ultisnips'
    " Snippets are separated from the engine. Add this if you want them:
    "Plugin 'honza/vim-snippets'

    "Bundle "jordwalke/VimCompleteLikeAModernEditor"
    " Trigger configuration. Do not use <tab> if you use
    " https://github.com/Valloric/YouCompleteMe.

    "let g:UltiSnipsExpandTrigger="<tab>"
    "let g:UltiSnipsJumpForwardTrigger="<Tab>"
    "let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

    " If you want :UltiSnipsEdit to split your window.
    "let g:UltiSnipsEditSplit="vertical"

    " The following are examples of different formats supported.
    " Keep Plugin commands between vundle#begin/end.
    " plugin on GitHub repo
    " Plugin 'tpope/vim-fugitive'
    " plugin from http://vim-scripts.org/vim/scripts.html
    " Plugin 'L9'
    " Git plugin not hosted on GitHub
    " Plugin 'git://git.wincent.com/command-t.git'
    " git repos on your local machine (i.e. when working on your own plugin)
    " Plugin 'file:///home/gmarik/path/to/plugin'
    " The sparkup vim script is in a subdirectory of this repo called vim.
    " Pass the path to set the runtimepath properly.
    " Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    " Avoid a name conflict with L9
    " Plugin 'user/L9', {'name': 'newL9'}

    " All of your Plugins must be added before the following line
    call vundle#end()            " required

    " Assign filetypes manually before detecting them.
    augroup filetypedetect
        au BufNewFile,BufRead *.asy    setfiletype asy
        " I don't know if this is the right thing to do, but it works for the
        " Asymptote project...:
        au BufNewFile,BufRead *.in     setfiletype cpp
        " This is the applescript filetype:
        au BufNewFile,BufRead *.scpt   setfiletype scpt
        au BufNewFile,BufRead *.md   setfiletype markdown
    augroup END

    " Detect filetypes by their extension and syntax
    filetype plugin indent on

    " Brief help
    " :PluginList          - list configured plugins
    " :PluginInstall(!)    - install (update) plugins
    " :PluginSearch(!) foo - search (or refresh cache first) for foo
    " :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line

" => General
    set shell=zsh
    " Sets how many lines of history VIM has to remember
    set history=700

    " Set to auto read when a file is changed from the outside
    set autoread

    " Set the window title to the current file being edited.
    set title

    " With a map leader it's possible to do extra key combinations
    " like <Leader>w saves the current file
    "let mapleader = <SPACE>
    "let g:mapleader = <SPACE>
    " The leader is currently "\", but with the remap, space is used.
    map <Space> <Leader>

    " Fast saving
    nnoremap <LocalLeader>w :w!<cr>

" => NeoComplete Configuration Settings
    " Add a function to toggle the neocomplete state.
    "map <LocalLeader>n :NeoCompleteToggle

    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplete#close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplete#enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplete#enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif

    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" => VIM user interface
    " Set 7 lines to the cursor - when moving vertically using j/k
    set so=4

    " Turn on the WiLd menu
    set wildmenu
    "set wildmode=list:longest

    " Ignore compiled files
    set wildignore=*.o,*~,*.pyc

    "Always show current position
    set ruler

    " Height of the command bar
    set cmdheight=2

    " A buffer becomes hidden when it is abandoned
    set hid

    " Configure backspace so it acts as it should act
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l

    " Ignore case when searching
    set ignorecase

    " When searching try to be smart about cases
    set smartcase

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
    set mat=2

    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set noerrorbells visualbell t_vb=
    set t_vb=
    set tm=500

    " Decrease the length of many prompts:
    set shortmess=atI

" => Colors and Fonts
    " Enable syntax highlighting
    syntax enable

    set background=dark
    colorscheme vividchalk2

    " Set extra options when running in GUI mode
    if has("gui_running")
        set guioptions-=T
        set guioptions+=e
        set t_Co=256
        set guitablabel=%M\ %t
    endif

    " Set utf8 as standard encoding and en_US as the standard language
    set encoding=utf8

    " Use Unix as the standard file type
    set ffs=unix,dos,mac

    " Resolve an issue with autocompletion YCM
    "let g:clang_user_options='|| exit 0'

" => Files, backups and undo
    " Turn backup off, since most stuff is in SVN, git et.c anyway...
    set nobackup
    set nowb
    set noswapfile " I don't know if I'm comfortable with this...

" => Text, tab and indent related
    " Use spaces instead of tabs
    set expandtab

    " Be smart when using tabs ;)
    set smarttab

    " 1 tab == 4 spaces
    set shiftwidth=4
    set tabstop=4

    " Linebreak on 500 characters
    set lbr
    set tw=0 " I don't really like this too much for TeX files.

    set ai "Auto indent
    set si "Smart indent
    set wrap "Wrap lines

" => Visual mode related
    " Visual mode pressing * or # searches for the current selection
    " Super useful! From an idea by Michael Naumann
    vnoremap <silent> * :call VisualSelection('f')<CR>
    vnoremap <silent> # :call VisualSelection('b')<CR>

" => Moving around, tabs, windows, and buffers
    " Treat long lines as break lines (useful when moving around in them)
    map j gj
    map k gk
    noremap ' `
    noremap ` '

    " By default, open new windows to the right.
    set splitright
    "map <c-space> ?

    " Deactivate search highlighting until the next search
    noremap <silent> <LocalLeader><cr> :noh<cr>

    " Smart way to move between windows
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l
    " More accesible than the control key:
    map <LocalLeader>h <C-W>h
    map <LocalLeader>l <C-W>l
    map <LocalLeader>j <C-W>j
    map <LocalLeader>k <C-W>k
    noremap <LocalLeader>d :q<cr>
    map <LocalLeader>H <C-w>H
    map <LocalLeader>L <C-w>L
    map <LocalLeader>J <C-w>J
    map <LocalLeader>K <C-w>K

    " NOTE: the function <C-W>i searches for the first occurance of a variable
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

    "Open alternate buffer (can be used to reopen a closed tab)
    noremap <LocalLeader>br :vs<Bar>:b#<CR>

    " Useful mappings for managing tabs
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
    " Goals: This may be syntax-based, but include the closing brace (C-style)/ tag (xml) in a fold.
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


    " Allow TeX documents to be folded according to their syntax. (This may be made irrelevant by LaTeX-Box)
    let g:tex_fold_enabled=1

" => Status line
    "statusline setup
    set statusline =%#identifier#
    set statusline+=[%t]    "tail of the filename
    set statusline+=%*

    "display a warning if fileformat isnt unix
    set statusline+=%#warningmsg#
    set statusline+=%{&ff!='unix'?'['.&ff.']':''}
    set statusline+=%*

    "display a warning if file encoding isnt utf-8
    set statusline+=%#warningmsg#
    set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
    set statusline+=%*

    set statusline+=%h      "help file flag
    set statusline+=%y      "filetype

    "read only flag
    set statusline+=%#identifier#
    set statusline+=%r
    set statusline+=%*

    "modified flag
    set statusline+=%#identifier#
    set statusline+=%m
    set statusline+=%*

    "set statusline+=%{fugitive#statusline()}

    "display a warning if &et is wrong, or we have mixed-indenting
    set statusline+=%#error#
    set statusline+=%{StatuslineTabWarning()}
    set statusline+=%*

    set statusline+=%{StatuslineTrailingSpaceWarning()}

    set statusline+=%{StatuslineLongLineWarning()}

    set statusline+=%#warningmsg#
    "set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    "display a warning if &paste is set
    set statusline+=%#error#
    set statusline+=%{&paste?'[paste]':''}
    set statusline+=%*

    set statusline+=%=      "left/right separator
    "if &filetype == "text"
        ""colorscheme distinguished
        "set statusline+=wc:%{WordCount()}\  " word count for text files
    "endif
    set statusline+=%{StatuslineCurrentHighlight()}\ \  "current highlight
    set statusline+=%c,     "cursor column
    set statusline+=%l/%L   "cursor line/total lines
    set statusline+=\ %P    "percent through file
    set laststatus=2

    "recalculate the trailing whitespace warning when idle, and after saving
    autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

    "return '[\s]' if trailing white space is detected
    "return '' otherwise
    function! StatuslineTrailingSpaceWarning()
        if !exists("b:statusline_trailing_space_warning")

            if !&modifiable
                let b:statusline_trailing_space_warning = ''
                return b:statusline_trailing_space_warning
            endif

            if search('\s\+$', 'nw') != 0
                let b:statusline_trailing_space_warning = '[\s]'
            else
                let b:statusline_trailing_space_warning = ''
            endif
        endif
        return b:statusline_trailing_space_warning
    endfunction


    "return the syntax highlight group under the cursor ''
    function! StatuslineCurrentHighlight()
        let name = synIDattr(synID(line('.'),col('.'),1),'name')
        if name == ''
            return ''
        else
            return '[' . name . ']'
        endif
    endfunction

    "recalculate the tab warning flag when idle and after writing
    autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

    "return '[&et]' if &et is set wrong
    "return '[mixed-indenting]' if spaces and tabs are used to indent
    "return an empty string if everything is fine
    function! StatuslineTabWarning()
        if !exists("b:statusline_tab_warning")
            let b:statusline_tab_warning = ''

            if !&modifiable
                return b:statusline_tab_warning
            endif

            let tabs = search('^\t', 'nw') != 0

            "find spaces that arent used as alignment in the first indent column
            let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

            if tabs && spaces
                let b:statusline_tab_warning =  '[mixed-indenting]'
            elseif (spaces && !&et) || (tabs && &et)
                let b:statusline_tab_warning = '[&et]'
            endif
        endif
        return b:statusline_tab_warning
    endfunction

    "recalculate the long line warning when idle and after saving
    autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

    " return a warning for "long lines" where "long" is either &textwidth or 80
    " (if "no &textwidth is set)
    "
    " return '' if no long lines
    " return '[#x,my,$z] if long lines are found, were x is the number of long
    " lines, y is the median length of the long lines and z is the length of the
    " longest line
    function! StatuslineLongLineWarning()
        if !exists("b:statusline_long_line_warning")

            if !&modifiable || &filetype == "text" " Don't warn about long lines in text files.
                let b:statusline_long_line_warning = ''
                return b:statusline_long_line_warning
            endif

            let long_line_lens = s:LongLines()

            if len(long_line_lens) > 0
                let b:statusline_long_line_warning = "[" .
                            \ '#' . len(long_line_lens) . "," .
                            \ 'm' . s:Median(long_line_lens) . "," .
                            \ '$' . max(long_line_lens) . "]"
            else
                let b:statusline_long_line_warning = ""
            endif
        endif
        return b:statusline_long_line_warning
    endfunction

    "return a list containing the lengths of the long lines in this buffer
    function! s:LongLines()
        let threshold = (&tw ? &tw : 80)
        let spaces = repeat(" ", &ts)
        let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
        return filter(line_lens, 'v:val > threshold')
    endfunction

    "find the median of the given array of numbers
    function! s:Median(nums)
        let nums = sort(a:nums)
        let l = len(nums)

        if l % 2 == 1
            let i = (l-1) / 2
            return nums[i]
        else
            return (nums[l/2] + nums[(l/2)-1]) / 2
        endif
    endfunction:%l\ C:%c

    set showcmd

    "function! WordCount()
        "let s:old_status = v:statusmsg
        "let position = getpos(".")
        "exe "silent normal g\<c-g>"
        "let s:word_count = str2nr(split(v:statusmsg)[11])
        "let v:statusmsg = s:old_status
        "call setpos('.', position)
        "return s:word_count
    "endfunction

    " Sets the current working directory to the location of the file bieng edited.
    autocmd BufEnter * silent! lcd %:p:h

" => Editing mappings
    " Remap VIM 0 to first non-blank character
    map 0 ^
    " Swap ; and : in normal mode (and vise-versa)
    noremap ; :
    noremap : ;
    "onoremap ; :
    "onoremap : ;
    "set langmap=:\\;,\\;:
    " Remap p to paste to the current indentation, wheras ctrl-p maps to normal paste.
    noremap p ]p
    noremap <C-P> p

    noremap <LocalLeader>o moo<Esc>`o
    noremap <LocalLeader>O moO<Esc>`o
    " This still must be fixed
    silent! call repeat#set("<LocalLeader>O", v:count)
    silent! call repeat#set("<LocalLeader>o", v:count)

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

    " Delete trailing white space on save, useful for Python and CoffeeScript ;)
    func! DeleteTrailingWS()
        " Add files from which you don't want to remove whitespace.
        if &filetype =~ 'vim'
            return
        endif
        exe "normal! mz"
        %s/\s\+$//e
        exe "normal! `z"
    endfunc
    autocmd BufWrite * call DeleteTrailingWS()

    " Maps <option-l> to <Esc>
    inoremap ¬ <Esc>
    " If <Esc> is used in a mapping here, then the command is executed (an old vi-compatability 'feature')
    cnoremap ¬ <c-c>
    noremap! ® <c-r>
    noremap ® <c-r>
    " Maps <option-w> to <ctrl-w> (Remove this once Caps-lock is remapped to ctrl)
    map ∑ <C-w>
    " Maps <option-f/b> to <ctrl-f/b> (Remove this once Caps-lock is remapped to ctrl)
    " (Page up-down)
    map ƒ <C-f>
    map ∫ <C-b>
    
    " Run the :make command
    nnoremap <LocalLeader>m<Space> :make<cr>

    " Append a semicolon to the end of a line
    noremap <LocalLeader>; mqA;<Esc>`q
    " Go to the link under the cursor
    noremap gl ml"lyiW:!open <c-r>l<CR>`l
    " This could also be removed once ctrl is made more accesible. However, it
    " *does* match nicely with the already in place tab...
    map <S-Tab> <C-o>

    " Quickly edit ~/.vimrc (i.e. likely this file) with ' ev' and source it with ' sv'
    nnoremap <LocalLeader>ev :tabedit $MYVIMRC<cr>
    nnoremap <LocalLeader>sv :source $MYVIMRC<cr>

    " Swap the default mappings (since 'append' is used more often here)
    map <Leader>ca <Plug>NERDCommenterAppend
    map <Leader>cA <Plug>NERDCommenterAltDelims
    " Non-toggling comment
    noremap <LocalLeader>co <Plug>NERDCommenterComment
    " Recursive comment
    noremap <LocalLeader>cr <Plug>NERDCommenterNested

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

    " Open vimgrep and put the cursor in the right position
    noremap <LocalLeader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

    " Vimgreps in the current file
    noremap <LocalLeader><space> :vimgrep // <C-R>%<C-b><right><right><right><right><right><right><right><right><right>

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
    nnoremap <LocalLeader>cc :rightbelow cope<cr>
    " Navigate through quickfix windows
    nnoremap <LocalLeader>cn :cnewer<CR>
    nnoremap <LocalLeader>cp :colder<CR>
    "noremap <LocalLeader>co :%y<cr>:tabnew<cr>:set syntax=qf<cr>pgg
    noremap <LocalLeader>n :cn<cr>
    noremap <LocalLeader>p :cp<cr>

" => Spell checking
    " Pressing ,ss will toggle and untoggle spell checking
    noremap <LocalLeader>ss :setlocal spell!<cr>

    " Shortcuts using <LocalLeader>
    map <LocalLeader>sn ]s
    map <LocalLeader>sp [s
    map <LocalLeader>sa zg
    map <LocalLeader>s? z=

" => Misc
    " Remove the Windows ^M - when the encodings gets messed up
    noremap <LocalLeader>mw mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

    " Quickly open a buffer for scripbble
    noremap <LocalLeader>qb :e ~/buffer<cr>
    " Quickly (attempt to) quit vim
    noremap <LocalLeader>qq :qall<CR>
    " Save the current vim session and quit (warn if there are unsaved changes).
    noremap <LocalLeader>qs :mksession!<CR>:qall<CR>

    " Toggle paste mode on and off
    noremap <LocalLeader>pp :setlocal paste!<cr>

    " This fantastic vim-sed will take a title and capitalize all words that are
    " at least 3 tharacters long!
    " 'add title'-case to the current line
    noremap <LocalLeader>at :s/\v<(.)(\w{2,})/\u\1\L\2/g<CR>

    " The following may not be that useful...
    " 'add date' after the cursor. 
    map <LocalLeader>ad a<C-R>=strftime("%Y-%m-%d")<CR><Esc>
    " 'ad name' after the cursor
    map <LocalLeader>an aJesse Frohlich<Esc>

" => Helper functions
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
