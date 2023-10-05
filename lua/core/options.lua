local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.expandtab = true
opt.autoindent = true
opt.smarttab  = true

-- whitespace highlighting
vim.opt.listchars = {
        eol = "¬",
        tab = ">·",
        trail = "~",
        extends = ">",
        precedes = "<",
}
opt.linebreak = true
opt.breakindent = true
opt.showbreak = "-> "
opt.wrap = true
opt.colorcolumn = {"+1","+2","+3"}
opt.textwidth = 80

-- keymap and key sequence timeouts
opt.timeout = false

-- clipboard
opt.clipboard:append("unnamedplus")

-- sign column
opt.signcolumn = "yes"

-- colors
opt.termguicolors = true

-- split windows
opt.splitright = true
opt.splitbelow = true

-- prefer version control systems over in-house backups
opt.swapfile = false
opt.writebackup = false

-- spellcheck
opt.spell = true
