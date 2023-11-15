return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	keys = {
		{
			"<Leader>nh",
			function()
				require("noice").cmd("history")
			end,
		},
		{
			"<Leader>nd",
			function()
				require("noice").cmd("dismiss")
			end,
		},
		{
			"<Leader>nl",
			function()
				require("noice").cmd("last")
			end,
		},
	},
	opts = {
		presets = {
			command_palette = true,
		},
	},
}
