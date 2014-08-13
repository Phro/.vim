Vim Configuration File
======================

This is my Vim configuration directory. It is based off of Amir Salihefendic's .vimrc (http://amix.dk/vim/vimrc.html), and the rest is whatever I have deemed useful. Some notable commands include
'Add Date' after the cursor while in normal mode
    map <LocalLeader>ad a<C-R>=strftime("%Y-%m-%d")<CR><Esc>

Swap ; and : in normal mode (and vise-versa)
    noremap ; :
    noremap : ;

Remap p to paste to the current indentation, wheras ctrl-p maps to normal paste.
    noremap p ]p
    noremap <C-P> p

Append a semicolon to the end of a line, keeping the cursor in the same place
    noremap <LocalLeader>; mqA;<Esc>`q

Go to the link under the cursor
    noremap gl ml"lyiW:!open <c-r>l<CR>`l

(w.r.t the NERDCommenter plugin) Swap the default mappings (since 'append' is used more often)
    map <Leader>ca <Plug>NERDCommenterAppend
    map <Leader>cA <Plug>NERDCommenterAltDelims

Quickly access the quickfix window for command/ script output, then scroll through these windows using ' cn' and ' cp'.
    nnoremap <LocalLeader>cc :rightbelow cope<cr>

Navigate through quickfix windows
    nnoremap <LocalLeader>cn :cnewer<CR>
    nnoremap <LocalLeader>cp :colder<CR>

Quickly (attempt to) quit vim
    noremap <LocalLeader>qq :qall<CR>
Save the current vim session and quit (warn if there are unsaved changes).
    noremap <LocalLeader>qs :mksession!<CR>:qall<CR>

Run the :make command
    nnoremap <LocalLeader>m<Space> :make<cr>

Add a new line above/ below the current one (works, but the '.' repeat command doesn't quite work yet)
    noremap <LocalLeader>o moo<Esc>`o
    noremap <LocalLeader>O moO<Esc>`o

There are a few other commands that I find useful that you may find, but they are mostly due to my keyboard layout and not necessarily going to be applicable to anyone else.
