local keymap = vim.keymap

vim.g.mapleader = " "
keymap.set("", " ", "<Nop>")

local function swap_keymaps(mode, map1, map2, opts)
	keymap.set(mode, map1, map2, opts)
	keymap.set(mode, map2, map1, opts)
end

keymap.set("n", "<Leader>ww", "<Cmd>update<CR>", { desc = "Write buffer" })
keymap.set("n", "<Leader>wa", "<Cmd>wall<CR>", { desc = "Write all buffers" })

-- Vertical motion should follow display lines, not true lines.
swap_keymaps("", "j", "gj")
swap_keymaps("", "k", "gk")

-- Jump to the exact position of a mark using ' instead of `.
swap_keymaps("", "'", "`")

-- Go to beginning of line with 0
swap_keymaps("", "0", "^")

-- Enter command line mode with ;
swap_keymaps("", ":", ";")

-- Move between windows with alt
keymap.set("n", "<a-h>", "<c-w>h")
keymap.set("n", "<a-j>", "<c-w>j")
keymap.set("n", "<a-k>", "<c-w>k")
keymap.set("n", "<a-l>", "<c-w>l")
keymap.set("t", "<a-h>", "<c-\\><c-n><c-w>h")
keymap.set("t", "<a-j>", "<c-\\><c-n><c-w>j")
keymap.set("t", "<a-k>", "<c-\\><c-n><c-w>k")
keymap.set("t", "<a-l>", "<c-\\><c-n><c-w>l")

-- Move windows with shift-alt
keymap.set("n", "<a-s-h>", "<c-w>H")
keymap.set("n", "<a-s-j>", "<c-w>J")
keymap.set("n", "<a-s-k>", "<c-w>K")
keymap.set("n", "<a-s-l>", "<c-w>L")
keymap.set("t", "<a-s-h>", "<c-\\><c-n><c-w>H")
keymap.set("t", "<a-s-j>", "<c-\\><c-n><c-w>J")
keymap.set("t", "<a-s-k>", "<c-\\><c-n><c-w>K")
keymap.set("t", "<a-s-l>", "<c-\\><c-n><c-w>L")

-- Paste to current indent level with p.
keymap.set("", "p", "]p")
keymap.set("", "<c-p>", "p")

-- Insert lines above or below current line.
keymap.set("", "<Leader>O", function()
	return "mo" .. vim.v.count1 .. "O<Esc>`o"
end, { expr = true, desc = "Insert blank line above" })
keymap.set("", "<Leader>o", function()
	return "mo" .. vim.v.count1 .. "o<Esc>`o"
end, { expr = true, desc = "Insert blank line below" })

-- Move lines vertically.
keymap.set("n", "-", function()
	return "mz:silent! move+" .. vim.v.count1 .. "<cr>`z"
end, { expr = true })
keymap.set("n", "_", function()
	return "mz:silent! move-" .. vim.v.count1 + 1 .. "<cr>`z"
end, { expr = true })
keymap.set("v", "-", function()
	return ":<c-u>silent!'<,'>move'>+" .. vim.v.count1 .. "<cr>`<my`>mzgv`yo`z"
end, { expr = true })
keymap.set("v", "_", function()
	return ":<c-u>silent!'<,'>move'<-" .. vim.v.count1 + 1 .. "<cr>`>my`<mzgv`yo`z"
end, { expr = true })

-- Toggle spell checking
keymap.set("", "<Leader>ss", ":setlocal spell!<CR>", {
	desc = "Toggle spellcheck",
})

-- Redraw the screen
keymap.set("", "<Leader>R", ":mode<CR>", { desc = "Redraw screen" })

-- Edit neovim configuration files
keymap.set("", "<Leader>cv", "<Cmd>NvimTreeOpen ~/.config/nvim/lua/user/<CR>")
keymap.set("", "<Leader>cf", function()
	local configdir = vim.fn.fnamemodify(vim.fn.expand("$MYVIMRC"), ":p:h")
	local filetype = vim.bo.filetype
	local filename = configdir .. "/ftplugin/" .. filetype
	local extension = vim.fn.filereadable(filename .. ".vim") == 1 and "vim" or "lua"
	vim.cmd("tabedit" .. filename .. "." .. extension)
end)

local function runCommand(command, err)
	if command then
		vim.cmd("!" .. command)
	else
        vim.api.nvim_err_writeln(err)
	end
end
local function testProject()
    runCommand(vim.b.testProject,"No testProject defined.")
end
local function buildProject()
    runCommand(vim.b.buildProject,"No buildProject defined.")
end
local function runProject()
runCommand(vim.b.runProject,"No runProject defined.")
end

keymap.set("", "MM", runProject)
keymap.set("", "MB", buildProject)
keymap.set("", "MT", testProject)
