return {
	"folke/tokyonight.nvim",
	lazy = false, -- load during startup
	priority = 1000, -- load first among plugins
	init = function()
		vim.cmd.colorscheme("tokyonight")
	end,
}
