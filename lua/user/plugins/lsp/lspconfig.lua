return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewfile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	opts = {
		servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			},
			rust_analyzer = { ["rust-analyzer"] = {
				diagnostics = {
					enable = true,
				},
			} },
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local function on_attach(client, bufnr)
			local keymapBuf = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, {
					silent = true,
					buffer = bufnr,
					desc = desc,
				})
			end

			keymapBuf("n", "gR", "<Cmd>Telescope lsp_references<CR>", "Show LSP references")

			keymapBuf("n", "gD", vim.lsp.buf.declaration, "Go to declaration")

			keymapBuf("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")

			keymapBuf("n", "gi", "<Cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")

			keymapBuf("n", "gt", "<Cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")

			keymapBuf({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, "See available code actions")

			keymapBuf("n", "<Leader>rn", vim.lsp.buf.rename, "Smart rename")

			keymapBuf("n", "<Leader>D", "<Cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")

			keymapBuf("n", "<Leader>d", vim.diagnostic.open_float, "Show line diagnostics")

			keymapBuf("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")

			keymapBuf("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic")

			keymapBuf("n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor")

			keymapBuf("n", "<Leader>rs", "<Cmd>LspRestart<CR>", "Restart LSP")
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local defaultServerOpts = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		local function setupServer(server, serverOpts)
			local serverOpts = vim.tbl_deep_extend("force", defaultServerOpts, serverOpts)
			lspconfig[server].setup(serverOpts)
		end

		for server, serverOpts in pairs(opts.servers) do
			setupServer(server, serverOpts)
		end
	end,
}
