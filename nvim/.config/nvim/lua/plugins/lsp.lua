return {

	{
		{
			"williamboman/mason.nvim",
			lazy = false,
			opts = {},
			config = function()
				require("mason").setup()
			end,
		},
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		-- Autocompletion
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				{ "saadparwaiz1/cmp_luasnip" },
				{ "hrsh7th/cmp-path" },
				{ "hrsh7th/cmp-nvim-lua" },
				{ "hrsh7th/cmp-buffer" },
			},
			event = "InsertEnter",
			config = function()
				local cmp = require("cmp")
				cmp.setup({
					preselect = "item",
					completion = {
						completeopt = "menu, menuone, noinsert",
					},
					sources = {
						{ name = "nvim_lsp" },
						{ name = "nvim_lua" },
						{ name = "luasnip" },
						{ name = "buffer" },
						{ name = "path" },
						{ name = "cmp-actions" },
					},
					mapping = cmp.mapping.preset.insert({
						["<C-Tab>"] = cmp.mapping.complete(),
						["<Tab>"] = cmp.mapping.confirm({ select = true }),

						["<C-u>"] = cmp.mapping.scroll_docs(-4),
						["<C-d>"] = cmp.mapping.scroll_docs(4),
					}),
					snippet = {
						expand = function(args)
							require("luasnip").lsp_expand(args.body)
						end,
					},
				})
			end,
		},

		-- LSP
		{
			"neovim/nvim-lspconfig",
			cmd = { "LspInfo", "LspInstall", "LspStart" },
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },
			},
			init = function()
				-- Reserve a space in the gutter
				-- This will avoid an annoying layout shift in the screen
				vim.opt.signcolumn = "yes"
			end,
			config = function()
				local lsp_defaults = require("lspconfig").util.default_config

				-- Add cmp_nvim_lsp capabilities settings to lspconfig
				-- This should be executed before you configure any language server
				lsp_defaults.capabilities = vim.tbl_deep_extend(
					"force",
					lsp_defaults.capabilities,
					require("cmp_nvim_lsp").default_capabilities()
				)

				-- LspAttach is where you enable features that only work
				-- if there is a language server active in the file
				vim.api.nvim_create_autocmd("LspAttach", {
					desc = "LSP actions",
					callback = function(event)
						local opts = { buffer = event.buf }

						vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts, { desc = "LSP Hover" })
						vim.keymap.set(
							"n",
							"gd",
							"<cmd>lua vim.lsp.buf.definition()<cr>",
							opts,
							{ desc = "Go to definition" }
						)
						vim.keymap.set(
							"n",
							"gD",
							"<cmd>lua vim.lsp.buf.declaration()<cr>",
							opts,
							{ desc = "Go to declaration" }
						)
						vim.keymap.set(
							"n",
							"gi",
							"<cmd>lua vim.lsp.buf.implementation()<cr>",
							opts,
							{ desc = "Go to implementation" }
						)
						vim.keymap.set(
							"n",
							"go",
							"<cmd>lua vim.lsp.buf.type_definition()<cr>",
							opts,
							{ desc = "Go to type definition" }
						)
						vim.keymap.set(
							"n",
							"gr",
							"<cmd>lua vim.lsp.buf.references()<cr>",
							opts,
							{ desc = "Find references" }
						)
						vim.keymap.set(
							"n",
							"gs",
							"<cmd>lua vim.lsp.buf.signature_help()<cr>",
							opts,
							{ desc = "Toggle signature help" }
						)
						vim.keymap.set(
							"n",
							"<F2>",
							"<cmd>lua vim.lsp.buf.rename()<cr>",
							opts,
							{ desc = "Rename instance in buffer" }
						)
						vim.keymap.set(
							{ "n", "x" },
							"<F3>",
							"<cmd>lua vim.lsp.buf.format({async = true})<cr>",
							opts,
							{ desc = "Format buffer" }
						)
						vim.keymap.set(
							"n",
							"ca",
							"<cmd>lua vim.lsp.buf.code_action()<cr>",
							opts,
							{ desc = "Open code actions" }
						)
						vim.keymap.set(
							"n",
							"<C-f>",
							"<cmd>cmp_action.luasnip_jump_forward()<cr>",
							opts,
							{ desc = "Jump forward" }
						)
						vim.keymap.set(
							"n",
							"<C-b>",
							"<cmd>cmp_action.luasnip_jump_backward()<cr>",
							opts,
							{ desc = "Jump backwards" }
						)
					end,
				})

				vim.diagnostic.config({
					signs = {
						text = {
							[vim.diagnostic.severity.ERROR] = "✘",
							[vim.diagnostic.severity.WARN] = "▲",
							[vim.diagnostic.severity.HINT] = "⚑",
							[vim.diagnostic.severity.INFO] = "»",
						},
					},
				})

				local capabilities = require("cmp_nvim_lsp").default_capabilities() --nvim-cmp

				local on_attach = function(client, bufnr)
					local function buf_set_keymap(...)
						vim.api.nvim_buf_set_keymap(bufnr, ...)
					end
					local function buf_set_option(...)
						vim.api.nvim_buf_set_option(bufnr, ...)
					end

					buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
				end

				require("mason-lspconfig").setup({
					ensure_installed = {
						"gopls",
						"lua_ls",
					},
					handlers = {
						-- this first function is the "default handler"
						-- it applies to every language server without a "custom handler"
						function(server_name)
							require("lspconfig")[server_name].setup({})
						end,
						lua_ls = function()
							-- (Optional) Configure lua language server for neovim
							require("lspconfig").lua_ls.setup({
								settings = {
									lua = {
										runtime = {
											version = "Lua 5.3",
											path = {
												"?.lua",
												"?/init.lua",
												vim.fn.expand("~/.luarocks/share/lua/5.3/?.lua"),
												vim.fn.expand("~/.luarocks/share/lua/5.3/?/init.lua"),
												"/usr/share/5.3/?.lua",
												"/usr/share/lua/5.3/?/init.lua",
											},
										},
										workspace = {
											library = {
												vim.fn.expand("~/.luarocks/share/lua/5.3"),
												"/usr/share/lua/5.3",
											},
										},
									},
								},
							})
						end,
						yamlls = function()
							require("lspconfig").yamlls.setup({
								capabilities = capabilities,
								on_attach = on_attach,
								settings = {
									yaml = {
										schemas = {
											["https://raw.githubusercontent.com/oapi-codegen/oapi-codegen/refs/heads/main/configuration-schema.json"] = "openapi/**/*.yaml",
											["https://smocker.dev/smocker.schema.json"] = "apimocks/**/*.yaml",
										},
									},
								},
							})
						end,
						gopls = function()
							require("lspconfig").gopls.setup({
								on_attach = on_attach,
								capabilities = capabilities,
								vim.api.nvim_create_autocmd("BufWritePre", {
									pattern = "*.go",
									callback = function()
										local params = vim.lsp.util.make_range_params()
										params.context = { only = { "source.organizeImports" } }
										-- buf_request_sync defaults to a 1000ms timeout. Depending on your
										-- machine and codebase, you may want longer. Add an additional
										-- argument after params if you find that you have to write the file
										-- twice for changes to be saved.
										-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
										local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
										for cid, res in pairs(result or {}) do
											for _, r in pairs(res.result or {}) do
												if r.edit then
													local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding
														or "utf-16"
													vim.lsp.util.apply_workspace_edit(r.edit, enc)
												end
											end
										end
										vim.lsp.buf.format({ async = false })
									end,
								}),
								settings = {
									gopls = {
										experimentalPostfixCompletions = true,
										analyses = {
											unusedparams = true,
											shadow = true,
											unusedwrite = true,
											unusedvariable = true,
											useany = true,
											nilness = true,
											fillreturns = true,
										},
										codelenses = {
											gc_details = false,
											generate = true,
											regenerate_cgo = true,
											run_govulncheck = true,
											test = true,
											tidy = true,
											upgrade_dependency = true,
											vendor = true,
										},
										hints = {
											assignVariableTypes = true,
											compositeLiteralFields = true,
											compositeLiteralTypes = true,
											constantValues = true,
											functionTypeParameters = true,
											parameterNames = true,
											rangeVariableTypes = true,
										},
										staticcheck = true,
										gofumpt = true,
										usePlaceholders = true,
										completeFunctionCalls = true,
										matcher = "Fuzzy",
									},
								},
							})
						end,
					},
				})
			end,
			golangci_lint_ls = function()
				require("golangci-lint-ls").setup({})
			end,
		},
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup({ preview_empty_name = true })
		end,
		keys = {
			{
				"<leader>cr",
				function()
					local inc_rename = require("inc_rename")
					return ":" .. inc_rename.config.cmd_name .. " "
				end,
				expr = true,
				desc = "Rename",
			},
		},
	},
	{
		"tpope/vim-commentary",
		lazy = false,
	},
	{
		"simondrake/gomodifytags",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			vim.api.nvim_create_user_command("GoAddTags", function(opts)
				require("gomodifytags").GoAddTags(opts.fargs[1], opts.args)
			end, { nargs = "+" })
			vim.api.nvim_create_user_command("GoRemoveTags", function(opts)
				require("gomodifytags").GoRemoveTags(opts.fargs[1], opts.args)
			end, { nargs = "+" })
		end,
		opts = {
			transformation = "snakecase",
			skip_unexported = true,
			override = true,
			options = { "json=omitempty" },
			parse = { enabled = true, seperator = "--" },
		},
	},
}
