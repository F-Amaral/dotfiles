return {
  {
    dir = "~/go/src/github.com/f-amaral/smartgf.nvim",
    dependencies = {
      { "ibhagwan/fzf-lua" }
    },
    name = "smartgf.nvim",
    lazy = false,
    config = function()
      require("smartgf").setup()
    end,
  }
}
