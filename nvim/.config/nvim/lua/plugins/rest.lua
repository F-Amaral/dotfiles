return {
	"rest-nvim/rest.nvim",
	ft = "http",
	dependencies = { { "nvim-lua/plenary.nvim" } },
	opts = {
		result_split_horizontal = true,
		skip_ssl_verification = true,
		encode_url = true,
		result = {
			show_url = true,
			show_headers = true,
			formmatters = {
				json = "jq",
				html = function(body)
					return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
				end,
			},
		},
		env_file = ".env",
		yank_dry_run = true,
	},
	keys = {
		{ "<leader>rr", "<Plug>RestNvim", { desc = "Run request", noremap = true, silent = true } },
		{ "<leader>rl", "<Plug>RestNvim", { desc = "Run last request", noremap = true, silent = true } },
		{
			"<leader>res",
			":RestSelectEnv ./rest/.env.stage.json",
			{ desc = "Change env to stage", noremap = true, silent = true },
		},
		{
			"<leader>rep",
			":RestSelectEnv ./rest/.env.prod.json",
			{ desc = "Change env to prod", noremap = true, silent = true },
		},
	},
	config = function(_, opts)
		require("rest-nvim").setup(opts)
	end,
}
