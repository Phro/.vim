" Summary:
  " Maintainer: Jesse Frohlich
  " Version: 1.1 (2021-02-24)
  " To Do:
    " See README.md for list
" Vim Plug:
  " Boilerplate:
    set nocompatible
    let g:plug_shallow=0
    " let g:plug_threads=4
    call plug#begin('~/.config/nvim/plugged')
  " Plugins:
    " Editor Specific:
      " Auto Closing: quotes, parentheses, etc.
        " This *will* get annoying in TeX with csquotes and the "" mapping.
        Plug 'jiangmiao/auto-pairs'
      " Autocompletion:
        if has('nvim')
          Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        else
          Plug 'Shougo/deoplete.nvim'
          Plug 'roxma/nvim-yarp'
          Plug 'roxma/vim-hug-neovim-rpc'
        endif
        Plug 'zchee/deoplete-jedi', {'for':'python'}
      " Autosave:
        Plug '907th/vim-auto-save'
      " Browser-embedding plugins:
        Plug 'glacambre/firenvim', {'do': { _ -> firenvim#install(0) }}
      " Colorscheme:
        " The altercation repo does not support true colors.  
        Plug 'frankier/neovim-colors-solarized-truecolor-only'
      " Colorizing:
        Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
      " Comment Handling Keymaps:
        Plug 'phro/nerdcommenter'
      " Entering Unicode:
        Plug 'chrisbra/unicode.vim'
      " Emoji Support:
        Plug 'fszymanski/deoplete-emoji'
      " Expand 'ga':
        Plug 'tpope/vim-characterize'
      " Filesystem Navigation: NERDtree
        " Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin',
              " \ { 'on': 'NERDTreeToggle' }
      " Git:
        " Fugitive:
          Plug 'tpope/vim-fugitive'
        " git-gutter: (Display unstaged changes)
          Plug 'airblade/vim-gitgutter'
      " Intelligent Dates: in/de-crementation' with <C-A>/<C-X>
        Plug 'tpope/vim-speeddating'
      " Intelligent Repeating: for 'speeddating' and 'surround'
        Plug 'tpope/vim-repeat'
      " Rename Files:
        Plug 'danro/rename.vim'
      " Set $EDITOR to current neovim instance.
        " TODO: set editor to edit vim files (almost) always in the same
        " instance.
        Plug 'rliang/termedit.nvim'
      " Snippets: Ultisnips
        Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
      " Status Line:
        " TODO: customize to the information I care about.
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
      " Surround Objects: with quotes, parentheses, etc.
        Plug 'tpope/vim-surround'
      " Undo Last Closed Window:
        " TODO: do you actually use this? No.
        " TODO: does this actually work?
        Plug 'AndrewRadev/undoquit.vim'
    " Language Specific:
      " Haskell:
        " Display symbols prettily
        Plug 'Twinside/vim-haskellConceal'
        " Expansion, highlighting, and indentation
        Plug 'neovimhaskell/haskell-vim'
      " LaTeX Support: Vimtex
        Plug 'lervag/vimtex', {'for': 'tex'}
              \ | Plug 'KeitaNakamura/tex-conceal.vim'
      " Markdown Syntax:
        " TODO: This is still not adequate,
        Plug 'gabrielelana/vim-markdown'
      " Mathematica:
        Plug 'rsmenon/vim-mathematica'
      " YAML Syntax Highlighting:
        " TODO: find / create one which handles muliline strings with colons.
        " This is also an indentation issue, which has less to do with
        " syntax-highlighting.
        Plug 'stephpy/vim-yaml'
    " Vim Plug Examples:

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
  " Plugin Settings:
    " Editor Specific:
      " Autosave: vim-auto-save
        " Fast saving, somewhat nulled by the following autosave:
          nnoremap <LocalLeader>w :w!<cr>
          nnoremap <LocalLeader>Wt :AutoSaveToggle<cr>
        " Autosave after leaving insert mode and making a change in normal mode
          let g:auto_save = 1
        let g:auto_save_silent = 1
        " Colorizing
        let g:Hexokinase_highlighters = [ 'backgroundfull' ]
        let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'
      " Deoplete:
        " Enable at startup
          let g:deoplete#enable_at_startup = 1
        " Use smartcase.
          call deoplete#custom#option({'smart_case': v:true})
        " Play well with backspace
          "" <C-h>, <BS>: close popup and delete backword char.
          inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
          inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
        " <cr>: close popup and save indent.
          inoremap <silent> <cr> <C-r>=<SID>my_cr_function()<cr>
          function! s:my_cr_function() abort
            return deoplete#close_popup() . "\<cr>"
          endfunction
        " tab-complete instead of just <c-n>
          inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
      " Expand 'ga'
        nmap ga <Plug>(UnicodeGA)
      " gitgutter
        set updatetime=100
      " NERDcommenter:
        " Add a space after the opening delimiter of a comment.
          let g:NERDSpaceDelims=1
        " Enable trimming of trailing whitespace when uncommenting
          let g:NERDTrimTrailingWhitespace = 1
        " Let NERDCommenterToggle check if all selected lines are commented
          let g:NERDToggleCheckAllLines = 1
        " Swap the default mappings (since 'append' is used more often here)
          map <Leader>ca <Plug>NERDCommenterAppend
          map <Leader>cA <Plug>NERDCommenterAltDelims
        " Non-toggling comment
          map <LocalLeader>co <Plug>NERDCommenterComment
        " Recursive comment
          map <LocalLeader>cr <Plug>NERDCommenterNested
        " Repeat commands
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
      " NERDtree:
        " autocmd StdinReadPre * let s:std_in=1
        " autocmd VimEnter * if argc() == 0
              " \ && !exists("s:std_in")
              " \ | NERDTree
              " \ | endif
        " nnoremap <localleader>n :NERDTreeToggle<cr>
      " Vim Airline:
        let g:airline_powerline_fonts = 1
        let g:airline_theme='solarized'
      " Ultisnips:
        "set runtimepath+=~/.config/nvim/my-snippets/
        "let g:UltiSnipsExpandTrigger="<C-s>"
        let g:UltiSnipsExpandTrigger="<Tab>"
        let g:UltiSnipsJumpForwardTrigger="<Tab>"
        let g:UltiSnipsJumpBackwardTrigger="<C-x>"
        let g:UltiSnipsEditSplit="context"
      " Emoji
        " Automatically convert emoji-codes to their unicode representation
          call deoplete#custom#source('emoji', 'converters', ['converter_emoji'])
        " Allow emoji in all filetypes
          " Note: consider removing TeX from this list.
          call deoplete#custom#source('emoji', 'filetypes', [])
    " Language Specific:
      " Vimtex:
        " Set viewer to mupdf
        let g:vimtex_view_method = 'mupdf'
        " Make the colour of mupdf easier on the eyes.
        let g:vimtex_view_mupdf_options = '-C DF8700'

        " For scrolling between various parenthesis sizes
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
            \   '-pdflatex',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \  ],
            \}
      " Markdown: vim-markdown
        let g:markdown_enable_conceal = 1
        let g:markdown_enable_mappings = 0
        let g:markdown_include_jekyll_support = 0
      " vim-mathematica
        let g:mma_highlight_option = "solarized"
        let g:mma_candy = 2
" General:
  set shell=zsh
  " Set to auto read when a file is changed from the outside
    set autoread
  " Set the window title to the current file being edited.
    set title
  " Line numbering
    set number
    set relativenumber
  " Set the number column width to at least two (default: 4)
    set numberwidth=2
  " Set the leader to space
    " Note: Backslash (the default leader) will still work
    map <Space> <Leader>
  " Reduce timeout length
    " This should fix the strange delay occurring in when the escape (^[) key
    " is pressed.
    set ttimeout
    set ttimeoutlen=0
    set notimeout
  " Set pwd to location of file of current window
    " The second command should be superfluous
    set autochdir
    " autocmd BufEnter * silent! lcd %:p:h
" Vim User Interface:
  " Keep 4 lines around the cursor at all times
    set scrolloff=4
  " Set wildmode to complete to the next common match
    set wildmode=longest:list
  " Ignore compiled files
    set wildignore=*.o,*~,*.pyc
  " Height of the command bar.
    " If you have space, you may wish this to be larger to avoid hit-enter
    " prompts.
    set cmdheight=1
  " A buffer becomes hidden when it is abandoned
    set hid
  " Configure backspace so it acts as it should act
    set backspace=eol,start,indent
  " Allow arrowkeys and h and l to move between lines when at extreme ends.
    set whichwrap+=<,>,h,l
  " When searching try to be smart about cases
    set ignorecase
    set smartcase
  " Dream: Would it be possible to enable all searches to use the \Z flag
    " (i.e., make searches blind to accents and umlauts (e.g. ü, á)?
  " Highlight search results only while searching
    augroup vimrc-incsearch-highlight
      autocmd!
      autocmd CmdlineEnter /,\? :set hlsearch
      autocmd CmdlineLeave /,\? :set nohlsearch
    augroup END
    " Toggle search highlighting if desired
      noremap <silent> <LocalLeader><cr> :set hlsearch!<cr>
  " Makes search act like search in modern browsers
    set incsearch
  " Don't redraw while executing macros (activate if performance is low)
    " set lazyredraw
  " Show matching brackets when text indicator is over them
    set showmatch
    " How many tenths of a second to blink when matching brackets
      set matchtime=1
  " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set noerrorbells visualbell t_vb=
    set t_vb=
    set tm=500
  " Decrease the length of many prompts:
    set shortmess=atI
" Colors
  " Set dark solarized theme
    set background=dark
    set termguicolors
    colorscheme solarized
  " Toggle background color
    nnoremap <Leader>as :call ToggleBackground()<cr>
    " Copied from solarized's togglebg.vim
    function! ToggleBackground()
      let &background = ( &background == "dark"? "light" : "dark" )
      if exists("g:colors_name")
          exe "colorscheme " . g:colors_name
      endif
    endfunction
  " Toggle Hexokinase (color display) [Show Colors]
    noremap <localleader>sc :HexokinaseToggle<cr>
  " Filetypes, backups and undo
  " Turn backup off, since most stuff is in SVN, git et.c anyway...
    set nobackup
    set nowb
    set noswapfile
  " New filetype detection
    augroup filetypedetect
      " Asymptote
        au BufRead,BufNewFile *.asy setfiletype asy
      " Mathematica (default is matlab)
        au BufRead,BufNewFile *.m setfiletype=mma
      " Sagemath
        au BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype python
    augroup end
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
  " Open a terminal at the bottom
    noremap <localleader>tl :belowright 5split +term<cr>
    noremap <localleader>tv :vs +term<cr>
    noremap <localleader>tt :tabedit +term<cr>
  " For git commit messages, limit line width.
    autocmd Filetype gitcommit setlocal spell textwidth=72
  " Make <c-r> act like normal in a terminal.
    tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
" Text, Tab, and Indent Related
  " Append mac to the list of file formats (if such a file would be edited)
    set fileformats=unix,dos,mac
  " In the IBLLinearAlgebra directory, don't use expandtab
    autocmd BufEnter ~/ed/ta/223/wb/IBLLinearAlgebra/* setlocal noexpandtab
  " Use two spaces instead of tabs in all contexts
    set expandtab
    set smarttab
    set shiftwidth=2
    set tabstop=2
  " SuperRetab function
    " TODO: add this command to a keymap or action hook.
    command! -nargs=1 -range SuperRetab
      \ <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g
  " Whitespace highlighting
    nnoremap <leader>S :set list!<cr>
    set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
  " Linebreak more cleanly
    set lbr
    set wrap " Wrap lines
    set tw=0 " Set this to a non-null number for *non*-TeX files
    set breakindent
    let &showbreak= '> '
  " Intelligent indenting
    set autoindent
    set smartindent
  " Make capital Y act as one would expect, but better
    noremap Y yg_
  " Copy to system clipboard
    vnoremap <leader>y "+y
    nnoremap <leader>Y "+yg_
    nnoremap <leader>y "+y
    nnoremap <leader>yy "+yy
  " Paste from clipboard
    nnoremap <leader>p "+p
    nnoremap <leader>P "+P
    vnoremap <leader>p "+p
    vnoremap <leader>P "+P
" Visual mode related
  " Visual mode pressing * or # searches for the current selection
    " Super useful! From an idea by Michael Naumann
    vnoremap <silent> * :call VisualSelection('f')<cr>
    vnoremap <silent> # :call VisualSelection('b')<cr>
" Moving around, tabs, windows, and buffers
  " NOTE: the function <C-W>i searches for the first occurrence of a variable
  " in a file (i.e. it's first declaration / definition). However, this
  " search is smart-cased (by the settings laid out in this .vimrc). A mod
  " should be introduced to change the case rules for this search to be
  " case-sensitive, since the majority of programming languages have
  " case-sensitive variable definitions.
  " Treat long lines as break lines
    noremap j gj
    noremap gj j
    noremap k gk
    noremap gk k
  " Cause ' to return you to the exact cursor position, rather than `
    noremap ' `
    noremap ` '
  " Escape exits terminal
    tnoremap <Esc> <C-\><C-n>
    vnoremap // y/<C-R>"<cr>
  " Enable the mouse in vim (disable with shift)
    set mouse=a
  " By default, open new windows to the right.
    set splitright
  " Smart way to move between windows
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
  " Close windows with one fewer keystroke
    noremap <Leader>d :q<cr>
    noremap <Leader>D :bdelete<cr>
  " Buffer maps
    " Close the current buffer
      noremap <LocalLeader>bd :Bclose<cr>
    " Close all the buffers
      noremap <LocalLeader>ba :1,1000 bd!<cr>
    " Open alternate buffer (can be used to reopen a closed tab)
      noremap <LocalLeader>br :vs<Bar>:b#<cr>
  " Useful mappings for managing tabs:
    noremap <LocalLeader>tn :tabnew<cr>
    noremap <LocalLeader>tc :tabclose<cr>
    noremap <LocalLeader>tm :-tabmove<cr>
    noremap <LocalLeader>tM :+tabmove<cr>
  " Open a new tab with the current buffer's path
    " Super useful when editing files in the same directory
    noremap <LocalLeader>te :tabedit <c-r>=expand("%:p:h")<cr>/
  " Specify the behavior when switching between buffers
    try
      set switchbuf=useopen,usetab,newtab
      set showtabline=2
    catch
    endtry
  " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal! g`\"" |
      \ endif
  " Remember info about open buffers on close
    set shada^=%

  set foldexpr=GetVimrcFold(v:lnum)

  function! GetVimrcFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
      return '-1'
    endif

    let this_indent=IndentLevel(a:lnum)
    let next_indent=IndentLevel(NextNonBlankLine(a:lnum))

    if next_indent <= this_indent
      return this_indent
    elseif next_indent > this_indent
      return '>' . next_indent
    return '0'
  endfunction

  function! IndentLevel(lnum)
      return indent(a:lnum) / &shiftwidth
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

  function! MyFoldText()
    let line = substitute(getline(v:foldstart),
      \  '\v%(^\s*)@<="|:$', ' ', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    " let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldchar = ' '
    let foldtextstart = strpart(line,  0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend,
      \ '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(' ', winwidth(0)-foldtextlength)
      \ . foldtextend
  endfunction
  set foldtext=MyFoldText()

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
" Status line
  " Always show a status line for every window
  set laststatus=2
  " Only show the tabline if there are multiple tabs
  set showtabline=1
  set showcmd
" Editing mappings
  " Swap go-to's for beginning of line and beginning of non-whitespace line.
    noremap 0 ^
    noremap ^ 0
  " Swap ; and : in normal mode (and vice-versa)
    " Note: Or should this be implemented always?
    noremap ; :
    noremap : ;
    onoremap ; :
    onoremap : ;
    "set langmap=:\\;,\\;:
  " p pastes to current indentation, whereas <c-p> pastes exactly.
    noremap p ]p
    noremap <C-p> p
  " Insert lines above or below current line.
    noremap <LocalLeader>O moO<Esc>`o
    noremap <LocalLeader>o moo<Esc>`o
  " This still must be fixed
    silent! call repeat#set("<LocalLeader>O", v:count)
    silent! call repeat#set("<LocalLeader>o", v:count)
  " Move line(s) of text using ALT+[jk] or Comamnd+[jk] on mac
    " TODO: if desired, also add '-' and '_' mappings
    nnoremap - mz:m+<cr>`z
    nnoremap _ mz:m-2<cr>`z
    vnoremap - :m'>+<cr>`<my`>mzgv`yo`z
    vnoremap _ :m'<-2<cr>`>my`<mzgv`yo`z
  " Clean up extraneous whitespace
    " Note: Good regex for removing superfluous spaces: be careful for table
    " alignment in, say TeX documents: \v([^ ]@<=) +
    noremap <LocalLeader>ts :call DeleteTrailingWS()<cr>
    noremap <LocalLeader>tS :call DeleteInternalWS()<cr>
    noremap <LocalLeader>T :call DeleteInternalWS()<cr>
    func! DeleteTrailingWS()
        " Add files from which you don't want to remove whitespace.
        if &filetype =~ 'vim'
            return
        endif
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
  " Don't insert two spaces after a '.', '!', or '?'
    set nojoinspaces
  " Save and run the :make command
    nnoremap <LocalLeader>m :w!<cr>:make<cr>
  " Go to the link under the cursor (browser-dependant)
    noremap gl ml"lyiW:!vimb <c-r>l<cr>`l
  " Use backspace to move through jumplist
    " This could also be removed once ctrl is made more accesible. However, it
    " *does* match nicely with the already in place tab...
    noremap <S-Tab> <C-o>
    noremap <bs> <C-o>
    noremap <s-bs> <C-i>
  " Quick access to config files
    " Edit and source this file and edit current filetype settings.
    nnoremap <Leader>ef :call EditFiletype()<cr>
    nnoremap <Leader>es :UltiSnipsEdit<cr>
    nnoremap <Leader>ev :tabedit $MYVIMRC<cr>
    nnoremap <Leader>sv :source $MYVIMRC<cr>

    function! EditFiletype()
      let configdir = fnamemodify(expand("$MYVIMRC"),":p:h")
      execute ":tabedit" . configdir . "/ftplugin/" . &filetype .".vim"
    endfunction
  " Open a quick buffer with currently defined mappings
    nnoremap <Leader>sm :call SeeMap(0)<cr>
    nnoremap <Leader>sM :call SeeMap(1)<cr>
    function! SeeMap(verbose)
      let l:filepath = "/tmp/vim-map-keys"
      execute "redir! > " . l:filepath
      execute "silent " . (a:verbose==1? "verbose":"") . " map"
      execute "redir END"
      execute "silent belowright 10split " . l:filepath
    endfunction
" Vimgrep searching and cope displaying
  " When you press gv you vimgrep after the selected text
    vnoremap <silent> gv :call VisualSelection('gv')<cr>
  " When running :s(ubstitute), show incremental changes.
    set inccommand=split
  " Search and replace selected text (FIXME: non-functional!)
    vnoremap <silent> <LocalLeader>r :call VisualSelection('replace')<cr>
  " Quickfix TODO: clean up
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
" Spell-checking
  " Check spelling by default
    " Disable in specific filetype configs if desired (esp. for .csv, .tex, etc.)
    set spell
  " Expand spell-checking to multiple languages (Be careful with this...)
    set spelllang=en
    "set spelllang=en,es,de
  " Toggle spell checking
    noremap <Leader>ss :setlocal spell!<cr>
  " Shortcuts using <LocalLeader>
    noremap <LocalLeader>sn ]s
    noremap <LocalLeader>sp [s
    noremap <LocalLeader>sa zg
    noremap <LocalLeader>s? z=
" Misc
  " Redraw the screen
    noremap <LocalLeader>r :mode<cr>
  " Quickly (attempt to) quit vim
    noremap <LocalLeader>qq :qall<cr>
  " Save the current vim session and quit (warn if there are unsaved changes).
    noremap <LocalLeader>qs :mksession!<cr>:qall<cr>
  " Start a web server in the current directory.
    noremap <LocalLeader>aw :call jobstart('python -m http.server')<cr>
  " Toggle paste mode on and off
    noremap <LocalLeader>Wp :setlocal paste!<cr>
  " 'Add Title'-case to the current line
    " This fantastic vim-sed will take a title and capitalize all words that are
    " at least 3 characters long!
    noremap <silent> <LocalLeader>at guu:call setline(line('.'),
        \ substitute(getline('.'), '\v<(.)(\w{3,})', '\u\1\L\2', 'g'))<cr>
  " Underline the current line (with dashes "u", or equals "U").
    noremap <LocalLeader>au yypVr-
    noremap <LocalLeader>aU yypVr=
  " 'Add Date' at the cursor (not very useful)
    noremap <LocalLeader>ad a<C-R>=strftime("%Y-%m-%d")<cr><Esc>
  " Yank file name to unnamed register
    noremap <LocalLeader>gf :let @" = expand("%")<cr>
" Helper functions
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
  " Don't close window when deleting a buffer
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
" vim: foldmethod=expr
