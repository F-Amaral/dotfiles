return {
  {
    'saghen/blink.compat',
    -- use v2.* for blink.cmp v1.*
    version = '2.*',
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      signature = { enabled = true },
      sources = {
        default = { "lsp", "buffer", "snippets", "path" },
        -- providers = {
        --   avante_commands = {
        --     name = "avante_commands",
        --     module = "blink.compat.source",
        --     score_offset = 90, -- show at a higher priority than lsp
        --     opts = {},
        --   },
        --   avante_files = {
        --     name = "avante_files",
        --     module = "blink.compat.source",
        --     score_offset = 100, -- show at a higher priority than lsp
        --     opts = {},
        --   },
        --   avante_mentions = {
        --     name = "avante_mentions",
        --     module = "blink.compat.source",
        --     score_offset = 1000, -- show at a higher priority than lsp
        --     opts = {},
        --   },
        -- },
      },
    },

    opts_extend = { "sources.default" }
  }
}
