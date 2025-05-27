return {
  "https://github.com/mbbill/undotree",
  lazy = false,
  config = function()
    vim.keymap.set("n", "<Leader>u", vim.cmd.UndotreeToggle)
  end
}
