return {
	"nvim-tree/nvim-tree.lua",
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	keys = {
		{ "<Leader>ee", "<Cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
		{ "<Leader>ef", "<Cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer on current file." },
		{ "<Leader>ec", "<Cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },
		{ "<Leader>er", "<Cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },
	},
	opts = {
		renderer = {
			indent_markers = { enable = true },
		},
		actions = {
			open_file = {
				window_picker = { enable = false },
			},
		},
	},
}
