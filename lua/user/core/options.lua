local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.expandtab = true
opt.autoindent = true
opt.smarttab = true
opt.tabstop = 4
opt.shiftwidth = 4

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
opt.colorcolumn = { "+1", "+2", "+3" }
opt.textwidth = 80
opt.scrolloff = 4
opt.sidescrolloff = 4

-- clipboard
opt.clipboard:append("unnamedplus")

-- make searches case-insensitive unless otherwise specified
opt.ignorecase = true
opt.smartcase = true

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

vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
	command = "silent! write",
	desc = "Auto-save.",
})

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
	pattern = "term://*",
	command = "startinsert",
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
	pattern = "term://*",
	command = "stopinsert",
})
