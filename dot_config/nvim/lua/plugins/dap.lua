return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			"<Leader>do",
			"<Leader>dc",
			"<Leader>dr",
			"<F5>",
			"<Leader>db",
			"<Leader>dB",
			"<Leader>dC",
			"<Leader>dlp>",
			"<Leader>dl",
		},
		config = function()
			vim.keymap.set("n", "<Leader>do", function()
				require("dapui").open()
			end)
			vim.keymap.set("n", "<Leader>dc", function()
				require("dapui").close()
			end)
			vim.keymap.set("n", "<Leader>dr", function()
				require("dap").restart()
			end)
			vim.keymap.set("n", "<F5>", function()
				if vim.fn.filereadable(".vscode/launch.json") then
					require("dap.ext.vscode").load_launchjs()
				end
				require("dap").continue()
			end)
			vim.keymap.set("n", "<F6>", function()
				require("dap").step_over()
			end)
			vim.keymap.set("n", "<F7>", function()
				require("dap").step_into()
			end)
			vim.keymap.set("n", "<F8>", function()
				require("dap").step_out()
			end)
			vim.keymap.set("n", "<Leader>db", function()
				require("dap").toggle_breakpoint()
			end)
			vim.keymap.set("n", "<Leader>dB", function()
				require("dap").set_breakpoint()
			end)
			vim.keymap.set("n", "<Leader>dC", function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end)
			vim.keymap.set("n", "<Leader>dlp", function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end)
			vim.keymap.set("n", "<Leader>dl", function()
				require("dap").run_last()
			end)

			local dap, dapui = require("dap"), require("dapui")

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
		end,
		dependencies = {
			{ "theHamsta/nvim-dap-virtual-text", lazy = true, opts = {} },
			{
				"rcarriga/nvim-dap-ui",
				lazy = true,
				opts = {
					{
						layouts = {
							{
								elements = {
									{
										id = "scopes",
										size = 0.50,
									},
									{
										id = "watches",
										size = 0.30,
									},
									{
										id = "breakpoints",
										size = 0.20,
									},
								},
								position = "left",
								size = 40,
							},
							{
								elements = {
									{
										id = "repl",
										size = 1,
									},
								},
								position = "bottom",
								size = 10,
							},
						},
					},
				},
			},
			{ "leoluz/nvim-dap-go", lazy = true, opts = {} },
		},
	},
}
