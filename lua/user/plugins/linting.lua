return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufWritePost" },
	keys = {
		{
			"<Leader>wl",
			function()
				require("lint").try_lint()
			end,
			desc = "Trigger linting",
		},
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", {})

		vim.api.nvim_create_autocmd("BufWritePost", {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
			desc = "Apply linter after writing buffer.",
		})
	end,
}
