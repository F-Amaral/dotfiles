return {
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require('telescope').setup {
        pickers = {
          live_grep = {
            file_ignore_patterns = { "node_modules", ".git", ".venv" },
            additional_args = function(_)
              return { "--hidden" }
            end,
          },
          find_files = {
            file_ignore_patterns = { "node_modules", ".git", ".venv" },
            hidden = true,
          },
        },
        extensions = {
          fzf = {}
        }
      }

      require('telescope').load_extension('fzf')
      vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)
      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
      vim.keymap.set("n", "<C-p>", require('telescope.builtin').git_files)
      require "config.telescope.multigrep".setup()
    end,
  },
}
