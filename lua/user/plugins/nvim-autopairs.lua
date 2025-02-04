return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	opts = {
		check_ts = true, -- enable treesitter
		ts_config = {
			lua = { "string" }, -- don't add pairs in lua string treesitter nodes
			javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
			java = false, -- don't check treesitter on java
		},
	},
	init = function()
		-- import nvim-cmp plugin (completions plugin)
		local cmp = require("cmp")

		-- import nvim-autopairs completion functionality
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		-- make autopairs and completion work together
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
