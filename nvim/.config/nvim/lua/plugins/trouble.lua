return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{
			"<leader>xx",
			function()
				local trouble = require("trouble")
				trouble.toggle("diagnostics")
			end,
			{ desc = "Toggle trouble panel" },
		},
		{
			"<leader>xX",
			function()
				local trouble = require("trouble")
				trouble.toggle("buffer")
			end,
			{ desc = "Trouble workspace" },
		},
		{
			"<leader>xd",
			function()
				local trouble = require("trouble")
				trouble.toggle("document_diagnostics")
			end,
			{ desc = "Trouble document" },
		},
		{
			"<leader>xq",
			function()
				local trouble = require("trouble")
				trouble.toggle("quickfix")
			end,
			{ desc = "Trouble quickfix" },
		},
		{
			"<leader>xl",
			function()
				local trouble = require("trouble")
				trouble.toggle("loclist")
			end,
			{ desc = "Trouble loclist" },
		},
		{
			"gR",
			function()
				local trouble = require("trouble")
				trouble.toggle("lsp_references")
			end,
			{ desc = "Trouble show lsp references" },
		},
	},
}
