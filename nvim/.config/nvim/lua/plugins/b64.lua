-- return {
-- 	"deponian/nvim-base64",
-- 	version = "*",
-- 	keys = {
-- 		-- Decode/encode selected sequence from/to base64
-- 		-- (mnemonic: [b]ase64)
-- 		{ "<Leader>b", "<Plug>(FromBase64)", mode = "v" },
-- 		{ "<Leader>B", "<Plug>(ToBase64)", mode = "v" },
-- 	},
-- 	config = function()
-- 		require("nvim-base64").setup()
-- 	end,
-- }
--

return {
	"taybart/b64.nvim",
	version = "*",
	keys = {
		{ "<Leader>b", '<cmd>lua require("b64").encode()<CR>', mode = "v", desc = "Encode buffer with b64", { noremap = true, silent = true } },
		{ "<Leader>B", '<cmd>lua require("b64").decode()<CR>', mode = "v", desc = "Decode buffer with b64", { noremap = true, silent = true  } },
	},
}
