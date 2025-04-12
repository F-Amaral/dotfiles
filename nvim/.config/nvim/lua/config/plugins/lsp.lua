return {
  {
    "https://github.com/neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    config = function()
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
      vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")


      local capabilities = require("blink.cmp").get_lsp_capabilities()
      require("lspconfig").lua_ls.setup { capabilities = capabilities }
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if not client then return end

          if client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
              end,
            })
          end
        end,
      })

      require("lspconfig").gopls.setup {
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
      }
    end,
  }
}
