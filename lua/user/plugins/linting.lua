return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufWritePost" },
	opts = {
		linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			python = { "pylint" },
		},
	},
	keys = {
		{
			"<Leader>wl",
			function()
				require("lint").try_lint()
			end,
			desc = "Trigger linting",
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("BufWritePost", {
			callback = function()
				require("lint").try_lint()
			end,
			desc = "Apply linter after writing buffer.",
		})
	end,
}
