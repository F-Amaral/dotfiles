return {

    {
        {
            'williamboman/mason.nvim',
            lazy = false,
            opts = {},
        },
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp"
        },
        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            event = 'InsertEnter',
            config = function()
                local cmp = require('cmp')

                cmp.setup({
                    preselect = 'item',
                    completion = {
                        completeopt = 'menu, menuone, noinsert'
                    },
                    sources = {
                        { name = 'nvim_lsp' },
                        { name = 'buffer' },
                    },
                    mapping = cmp.mapping.preset.insert({
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ['<Tab>'] = cmp.mapping.confirm({ select = true }),

                        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    }),
                    snippet = {
                        expand = function(args)
                            require('luasnip').lsp_expand(args.body)
                        end,
                    },
                })
            end
        },

        -- LSP
        {
            'neovim/nvim-lspconfig',
            cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
            event = { 'BufReadPre', 'BufNewFile' },
            dependencies = {
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },
            },
            init = function()
                -- Reserve a space in the gutter
                -- This will avoid an annoying layout shift in the screen
                vim.opt.signcolumn = 'yes'
            end,
            config = function()
                local lsp_defaults = require('lspconfig').util.default_config

                -- Add cmp_nvim_lsp capabilities settings to lspconfig
                -- This should be executed before you configure any language server
                lsp_defaults.capabilities = vim.tbl_deep_extend(
                    'force',
                    lsp_defaults.capabilities,
                    require('cmp_nvim_lsp').default_capabilities()
                )

                -- LspAttach is where you enable features that only work
                -- if there is a language server active in the file
                vim.api.nvim_create_autocmd('LspAttach', {
                    desc = 'LSP actions',
                    callback = function(event)
                        local opts = { buffer = event.buf }

                        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts, { desc = "LSP Hover" })
                        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts,
                            { desc = "Go to definition" })
                        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts,
                            { desc = "Go to declaration" })
                        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts,
                            { desc = "Go to implementation" })
                        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts,
                            { desc = "Go to type definition" })
                        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts,
                            { desc = "Find references" })
                        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts,
                            { desc = "Toggle signature help" })
                        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts,
                            { desc = "Rename instance in buffer" })
                        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts,
                            { desc = "Format buffer" })
                        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts,
                            { desc = "Open code actions" })
                        vim.keymap.set('n', '<C-f>', '<cmd>cmp_action.luasnip_jump_forward()<cr>', opts,
                            { desc = "Jump forward" })
                        vim.keymap.set('n', '<C-b>', '<cmd>cmp_action.luasnip_jump_backward()<cr>', opts,
                            { desc = "Jump backwards" })
                    end,
                })

                vim.diagnostic.config({
                    signs = {
                        text = {
                            [vim.diagnostic.severity.ERROR] = '✘',
                            [vim.diagnostic.severity.WARN] = '▲',
                            [vim.diagnostic.severity.HINT] = '⚑',
                            [vim.diagnostic.severity.INFO] = '»',
                        },
                    },
                })

                require('mason-lspconfig').setup({
                    ensure_installed = {
                        "sumneko_lua",
                        "gopls",
                        "rust_analyzer",
                        "tsserver",
                        "jsonls",
                    },
                    handlers = {
                        -- this first function is the "default handler"
                        -- it applies to every language server without a "custom handler"
                        function(server_name)
                            require('lspconfig')[server_name].setup({})
                        end,
                        lua_ls = function()
                            -- (Optional) Configure lua language server for neovim
                            require("lspconfig").lua_ls.setup({
                                settings = {
                                    Lua = {
                                        runtime = {
                                            version = 'Lua 5.3',
                                            path = {
                                                '?.lua',
                                                '?/init.lua',
                                                vim.fn.expand '~/.luarocks/share/lua/5.3/?.lua',
                                                vim.fn.expand '~/.luarocks/share/lua/5.3/?/init.lua',
                                                '/usr/share/5.3/?.lua',
                                                '/usr/share/lua/5.3/?/init.lua',
                                            }
                                        },
                                        workspace = {
                                            library = {
                                                vim.fn.expand '~/.luarocks/share/lua/5.3',
                                                '/usr/share/lua/5.3'
                                            }
                                        }
                                    }
                                }

                            })
                        end,
                        gopls = function()
                            require("lspconfig").gopls.setup({
                                on_attach = function(client, bufnr)
                                    -- client.server_capabilities.semanticTokensProvider = nil
                                end,
                                settings = {
                                    gopls = {
                                        analyses = {
                                            unusedparams = true,
                                            shadow = true,
                                            unusedwrite = true,
                                            unusedvariable = true,
                                            useany = true,
                                            nilness = true,
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

                    }
                })
            end
        }
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

}
