local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  cmd = { "vscode-json-language-server", "--stdio" },
  capabilities = capabilities,
  filetypes = { "json", "jsonc" },
  root_markers = { ".git" },
  init_options = {
    provideFormatter = true
  },
  settings = {
    json = {
      schemas = require('schemastore').json.schemas {
        select = {
          '.eslintrc',
          'package.json',
        },
      },
      validate = { enable = true },
      format = { enable = true },
      completion = true,
      hover = true,
      validate = true,
    },
  }
}
