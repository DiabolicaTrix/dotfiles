return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		keys = {
			{ "[e", vim.diagnostic.open_float },
			{ "[d", vim.diagnostic.goto_prev },
			{ "]d", vim.diagnostic.goto_next },
			{ "[q", vim.diagnostic.setloclist },
			{ "<Leader>fd", ":Telescope diagnostics<CR>" },
		},
		config = function()
			local format = function(bufnr)
				vim.lsp.buf.format({
					filter = function(c)
						return c.name == "null-ls"
					end,
					bufnr = bufnr,
				})
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "L", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<Leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<Leader>gD", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<Leader>bf", function()
						vim.lsp.buf.format({
							async = true,
						})
					end, opts)

					if client.supports_method("textDocument/formatting") then
						local augroup = vim.api.nvim_create_augroup("UserLspFormat", { clear = true })
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = ev.buf })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = ev.buf,
							callback = function()
								format(ev.buf)
							end,
						})
					end
				end,
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- Languages
					"gopls",
					"pyright",
					"tsserver",
					"lua_ls",
					"rust_analyzer",
					-- Tools
					"terraformls",
					"dockerls",
					"helm_ls",
					-- Markup
					"yamlls",
					"jsonls",
				},

				handlers = {
					function(server_name) -- default handler (optional)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,

					["yamlls"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.yamlls.setup({
							capabilities = capabilities,
							on_attach = function(client, _)
								if client.name == "yamlls" and vim.bo.filetype == "helm" then
									vim.lsp.stop_client(client.id)
								end
							end,
							settings = {
								schemaStore = {
									url = "https://www.schemastore.org/api/json/catalog.json",
									enable = true,
								},
								yaml = {
									schemas = {
										["kubernetes"] = "/*.yaml",
									},
								},
							},
						})
					end,

					["helm_ls"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.helm_ls.setup({
							settings = {
								["helm-ls"] = {
									yamlls = {
										path = "yaml-language-server",
										config = {
											schemas = {
												["kubernetes"] = "/*.yaml",
											},
										},
									},
								},
							},
						})
					end,

					["lua_ls"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim" },
									},
								},
							},
						})
					end,
				},
			})
		end,
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
			})

			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.gotmpl = {
				install_info = {
					url = "https://github.com/ngalaiko/tree-sitter-go-template",
					files = { "src/parser.c" },
				},
				filetype = "gotmpl",
				used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl" },
			}
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local none_ls = require("null-ls")

			none_ls.setup({
				sources = {
					-- none_ls.builtins.formatting.prettier,
					none_ls.builtins.formatting.stylua,
					none_ls.builtins.formatting.goimports,
				},
			})
		end,
	},
	{ "towolf/vim-helm", ft = "helm" }, -- Helm not working properly with treesitter so using a custom plugin
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<Leader>xx",
				function()
					require("trouble").toggle()
				end,
			},
			{
				"<Leader>xw",
				function()
					require("trouble").toggle("workspace_diagnostics")
				end,
			},
			{
				"<Leader>xd",
				function()
					require("trouble").toggle("document_diagnostics")
				end,
			},
			{
				"<Leader>xq",
				function()
					require("trouble").toggle("quickfix")
				end,
			},
			{
				"<Leader>xl",
				function()
					require("trouble").toggle("loclist")
				end,
			},
			{
				"gR",
				function()
					require("trouble").toggle("lsp_references")
				end,
			},
		},
		opts = {},
	},
}
