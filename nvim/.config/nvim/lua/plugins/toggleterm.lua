return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = false,
	opts = {
		size = 40,
		open_mapping = [[<leader>/]],
		start_in_insert = true,
		insert_mappings = false,
		direction = "horizontal",
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)
	end,
}
