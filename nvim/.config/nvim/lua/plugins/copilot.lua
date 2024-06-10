return {
	"zbirenbaum/copilot-cmp",
	dependencies = {
		{
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			event = "InsertEnter",
			opts = {
				enabled = true,
				auto_refresh = true,
				suggestion = { enabled = false },
				panel = { enabled = false },
			},
			config = function(_, opts)
				require("copilot").setup(opts)
			end,
		},
	},

	config = function()
		require("copilot_cmp").setup()
	end,
}
