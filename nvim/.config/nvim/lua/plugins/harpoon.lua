return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()


        -- -- Basic Telescope configuration
        -- local conf = require("telescope.config").values
        -- local function toggle_telescope(harpoon_files)
        --     local file_paths = {}
        --     for _, item in ipairs(harpoon_files.items) do
        --         table.insert(file_paths, item.value)
        --     end

        --     require("telescope.pickers").new({}, {
        --         prompt_title = "Harpoon",
        --         finder = require("telescope.finders").new_table({
        --             results = file_paths,
        --         }),
        --         previewer = conf.file_previewer({}),
        --         sorter = conf.generic_sorter({}),
        --     }):find()
        -- end
        vim.keymap.set("n", "<Leader>a", function() harpoon:list():add() end, { desc = "Harpoon file (add to list)" })
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Toggle harpooned files" })

        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Goto harpooned file 1" })
        vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end, { desc = "Goto harpooned file 2" })


        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Goto next harpooned" })
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Goto prev harpooned" })
    end
}
