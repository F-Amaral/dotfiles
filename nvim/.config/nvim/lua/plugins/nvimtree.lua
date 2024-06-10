return {
    "nvim-tree/nvim-tree.lua",
    config = true,
    keys = {
        {
            "<leader>fe",
            function()
                local api = require("nvim-tree.api")
                api.tree.toggle()
            end,
            desc = "Toggle Nvim Tree"
        },
        {
            "<BS>",
            function()
                local api = require("nvim-tree.api")
                api.tree.change_root_to_parent()
            end,
            desc = "Change root to parent"
        },
        {
            "?",
            function()
                local api = require("nvim-tree.api")
                api.tree.toggle_help()
            end,
            desc = "Toggle nvimtree help"
        },
        {
            ".",
            function()
                local api = require("nvim-tree.api")
                api.tree.change_root_to_node()
            end,
            desc = "Change root to node"
        },
    },
}
