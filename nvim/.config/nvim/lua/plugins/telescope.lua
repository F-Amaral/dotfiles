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
			{
				"<leader>bd",
				vim.cmd.bdelete,
				{ desc = "Delete buffer" },
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		config = function()
			require("bufferline").setup()
		end,
		keys = {
			{
				"<Tab>",
				vim.cmd.bnext,
				{ desc = "Cycle next buffer", mode = "n" },
			},
			{
				"<S-Tab>",
				vim.cmd.bprev,
				{ desc = "Cycle prev buffer", mode = "n" },
			},
		},
	},
}
