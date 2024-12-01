return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		opts = {},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				pickers = {
					live_grep = {
						file_ignore_patterns = { "node_modules", ".git", ".venv" },
						additional_args = function(_)
							return { "--hidden" }
						end,
					},
					find_files = {
						file_ignore_patterns = { "node_modules", ".git", ".venv" },
						hidden = true,
					},
				},
				extensions = {
					"fzf",
				},
			})
			telescope.load_extension("fzf")
		end,
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
