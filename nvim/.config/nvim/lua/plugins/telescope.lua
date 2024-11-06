return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {},
        keys = {
            {
                "<leader>bb",
                function()
                    require("telescope.builtin").buffers()
                end,
                { desc = "Show buffers" },
            },
        },
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        lazy = false,
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        },
        keys = {

            {
                "<leader>bd",
                "<Cmd>BufferClose<CR>",
                { desc = "Delete buffer" },
            },
            {
                "<Tab>",
                "<Cmd>BufferNext<CR>",
                { desc = "Cycle to next buffer" },
            },
            {
                "<S-Tab>",
                "<Cmd>BufferPrevious<CR>",
                { desc = "Cycle to next buffer" },
            },
            {
                "<S-Tab>",
                "<Cmd>BufferPrevious<CR>",
                { desc = "Cycle to preivous buffer" },
            },
            {
                "<A-p>",
                "<Cmd>BufferPick<CR>",
                { desc = "Magic buffer pick" },
            }

        }
    },
}
