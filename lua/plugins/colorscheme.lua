return {
	"frankier/neovim-colors-solarized-truecolor-only",
	lazy = false,    -- load during startup
	priority = 1000, -- load first among plugins
	config = function()
		vim.cmd [[ colorscheme solarized ]]
	end
}
