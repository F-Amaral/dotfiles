return {
    "stevearc/oil.nvim",
    opts = {
        default_file_explorer = true,
        columns = {
            "icon",
        },
        buf_options = {
            buflisted = false,
            bufhidden = "hide",
        },
        win_options = {
            wrap = false,
            signcolumn = "no",
            cursorcolumn = false,
            foldcolumn = "0",
            spell = false,
            list = false,
            conceallevel = 3,
            concealcursor = "nvic",
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        lsp_file_methods = {
            timeout_ms = 1000,
            autosave_changes = true,
        },
        view_options = {
            -- Show files and directories that start with "."
            show_hidden = true,
            -- This function defines what is considered a "hidden" file
            is_hidden_file = function(name, bufnr)
              return vim.startswith(name, ".")
            end,
            -- This function defines what will never be shown, even when `show_hidden` is set
            is_always_hidden = function(name, bufnr)
              return false
            end,
            -- Sort file names in a more intuitive order for humans. Is less performant,
            -- so you may want to set to false if you work with large directories.
            natural_order = true,
            sort = {
              -- sort order can be "asc" or "desc"
              -- see :help oil-columns to see which columns are sortable
              { "type", "asc" },
              { "name", "asc" },
            },
        },
    },
    dependencies = { 
        "nvim-tree/nvim-web-devicons",
    },
    keys = {

      { "<leader>fe", function() require("oil").toggle_float()  end , desc = "Toggle Oil Float" },
    }




    -- "nvim-tree/nvim-tree.lua",
    -- config = true,
    -- keys = {
    --     {
    --         "<leader>fe",
    --         function()
    --             local api = require("nvim-tree.api")
    --             api.tree.toggle()
    --         end,
    --         desc = "Toggle Nvim Tree"
    --     },
    --     {
    --         "<BS>",
    --         function()
    --             local api = require("nvim-tree.api")
    --             api.tree.change_root_to_parent()
    --         end,
    --         desc = "Change root to parent"
    --     },
    --     {
    --         "?",
    --         function()
    --             local api = require("nvim-tree.api")
    --             api.tree.toggle_help()
    --         end,
    --         desc = "Toggle nvimtree help"
    --     },
    --     {
    --         ".",
    --         function()
    --             local api = require("nvim-tree.api")
    --             api.tree.change_root_to_node()
    --         end,
    --         desc = "Change root to node"
    --     },
    -- },
    --
}
