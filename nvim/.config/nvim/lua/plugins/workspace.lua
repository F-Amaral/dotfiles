return {
	"sanathks/workspace.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	opts = {
		workspaces = {
			{ name = "Meli", path = "~/go/src/github.com/melisource", keymap = { "<leader>wm" } },
			{ name = "Personal", path = "~/go/src/github.com/f-amaral", keymap = { "<leader>wf" } },
			{ name = "Config", path = "~/.config", keymap = { "<leader>wc" } },
			{ name = "Notes", path = "~/notes", keymap = { "<leader>wn" } },
			{ name = "Downloads", path = "~/Downloads", keymap = { "<leader>wd" } },
		},
	},
	keys = {
		{
			"<leader>wv",
			function()
				require("workspace").tmux_sessions()
			end,
		},
	},
	config = function(_, opts)
		require("workspace").setup(opts)
	end,
}
