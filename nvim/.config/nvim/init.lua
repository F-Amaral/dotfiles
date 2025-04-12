require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
