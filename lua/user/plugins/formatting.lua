return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<C-s>",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			css = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
			json5 = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettier" },
			rust = { "rustfmt" },
			haskell = { "ormolu" },
			cmake = { "cmakelang" },
			bash = { "beautysh" },
		},
		formatters = {
			prettier = {
				prepend_args = function()
					return { "--prose-wrap", "always" }
				end,
			},
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
