return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				keys = {
					{
						"<leader>du",
						function()
							local dapui = require("dapui")
							dapui.toggle({})
						end,
						{ desc = "Dap UI" },
					},
					{
						"<leader>de",
						function()
							local dapui = require("dapui")
							dapui.eval()
						end,
						{ desc = "Eval", mode = { "n", "v" } },
					},
				},
				opts = {},
				config = function(_, opts)
					local dap = require("dap")
					local dapui = require("dapui")
					dapui.setup(opts)
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open({})
					end
					dap.listeners.after.event_terminated["dapui_config"] = function()
						dapui.close({})
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close({})
					end
				end,
			},
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = "mason.nvim",
				cmd = { "DapInstall", "DapUninstall" },
				opts = {
					-- Makes a best effort to setup the various debuggers with
					-- reasonable debug configurations
					automatic_installation = true,

					-- You can provide additional configuration to the handlers,
					-- see mason-nvim-dap README for more information
					handlers = {},

					-- You'll need to check that you have the required things installed
					-- online, please don't ask me how to install them :)
					ensure_installed = {
						-- Update this to ensure that you have the debuggers for the langs you want
					},
				},
			},
		},
		keys = {
			{
				"<leader>dc",
				function()
					local dap = require("dap")
					dap.continue()
				end,
				{ desc = "Continue" },
			},
			{
				"<F7>",
				function()
					local dap = require("dap")
					dap.step_into()
				end,
				{ desc = "Step into" },
			},
			{
				"<F8>",
				function()
					local dap = require("dap")
					dap.step_over()
				end,
				{ desc = "Step over" },
			},
			{
				"<S-F8>",
				function()
					local dap = require("dap")
					dap.step_out()
				end,
				{ desc = "Step out" },
			},
			{
				"<leader>db",
				function()
					local dap = require("dap")
					dap.toggle_breakpoint()
				end,
				{ desc = "Set Breakpoint" },
			},
		},
		config = function()
			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
		end,
	},
	{
		"leoluz/nvim-dap-go",
	},
	{
		"nvim-telescope/telescope-dap.nvim",
	},
}
