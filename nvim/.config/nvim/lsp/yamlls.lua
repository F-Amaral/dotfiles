return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.helm-values" },
  root_markers = { ".git" },
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
      },
      schemas = require('schemastore').yaml.schemas {
        select = {
          'openapi.json',
          'docker-compose.yml',
        },
      },
      format = { enable = true },
      completion = true,
      hover = true,
      validate = true,
    },
  }
}
