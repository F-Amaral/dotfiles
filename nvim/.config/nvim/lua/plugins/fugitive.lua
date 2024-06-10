return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
		keys = {
			{ "<Leader>gp", "<cmd>Gitsigns preview_hunk<CR>", mode = "n" },
		},
	},
}
