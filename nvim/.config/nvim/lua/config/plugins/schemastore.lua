return {
  "b0o/schemastore.nvim",

  "cenk1cenk2/schema-companion.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
  },
  config = function()
    require("schema-companion").setup({
      schemas = require('schemastore').yaml.schemas(),
      enable_telescope = true,
    })
    vim.keymap.set("n", "<C-s>", require("telescope").extensions.schema_companion.select_schema())
  end,
}
