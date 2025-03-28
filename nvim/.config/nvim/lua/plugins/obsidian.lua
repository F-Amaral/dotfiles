return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "work",
				path = "~/notes/work",
			},
		},
		completion = {
			-- Set to false to disable completion.
			nvim_cmp = true,

			-- Trigger completion at 2 chars.
			min_chars = 2,

			-- Where to put new notes created from completion. Valid options are
			--  * "current_dir" - put new notes in same directory as the current buffer.
			--  * "notes_subdir" - put new notes in the default notes subdirectory.
		},
	},
}
