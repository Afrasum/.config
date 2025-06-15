return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},

	config = function()
		---------------------------------------------------------------------------
		-- NØKKELKART, DIAGNOSTIKK-IKONER m.m.  (behold alt du hadde her)
		---------------------------------------------------------------------------
		-- …  (samme keymap-autocmd-blokk og DiagnosticSign-delen du allerede har)

		---------------------------------------------------------------------------
		-- LSP-servere via mason-lspconfig v2  (NYTT API)
		---------------------------------------------------------------------------
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		require("mason-lspconfig").setup_handlers({

			-- Standard-handler for alle som ikke er spesifikt nevnt
			function(server)
				lspconfig[server].setup({ capabilities = capabilities })
			end,

			-- Lua
			lua_ls = function()
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							completion = { callSnippet = "Replace" },
						},
					},
				})
			end,

			-- Svelte
			svelte = function()
				lspconfig.svelte.setup({
					capabilities = capabilities,
					on_attach = function(client, _)
						vim.api.nvim_create_autocmd("BufWritePost", {
							pattern = { "*.js", "*.ts" },
							callback = function(ctx)
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
							end,
						})
					end,
				})
			end,

			-- GraphQL
			graphql = function()
				lspconfig.graphql.setup({
					capabilities = capabilities,
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				})
			end,

			-- Emmet
			emmet_ls = function()
				lspconfig.emmet_ls.setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,

			-- legg evt. også prismals, ts_ls (= TypeScript) osv. her om du trenger egne innstillinger
		})
	end,
}
