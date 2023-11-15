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
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		messages = {
			view = "mini",
		},
		views = {
			mini = {
				win_options = { winblend = 0 },
			},
		},
	},
}
