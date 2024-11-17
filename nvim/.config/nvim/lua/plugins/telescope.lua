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
}
