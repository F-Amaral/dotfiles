return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require('gitsigns').setup({
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')
          gitsigns.preview_hunk()
        end
      })
    end,
    keys = {
      { "<Leader>gp", "<cmd>Gitsigns preview_hunk<CR>", mode = "n", desc = "Open preview" },
    },
  }

}
