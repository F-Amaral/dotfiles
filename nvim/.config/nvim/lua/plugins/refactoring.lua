return {
    "theprimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("refactoring").setup()
    end,
    keys = {
        {
            "<leader>ri", function()
            local refactoring = require("refactoring")
            refactoring.refactor('Inline Variable')
        end,
            {
                desc = "Refactor inline variable", modes = { "v" }, noremap = true, silent = true, expr = false
            }
        },

    },
}
