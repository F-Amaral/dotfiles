return {
  'sindrets/diffview.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require("diffview").setup({
      -- Optional: tweak these settings to your liking
      enhanced_diff_hl = true, -- Better syntax highlighting
      view = {
        merge_tool = {
          layout = "diff3_horizontal", -- or "diff3_horizontal"
          -- disable_diagnostics = true,
        },
      },

    })
  end
}
