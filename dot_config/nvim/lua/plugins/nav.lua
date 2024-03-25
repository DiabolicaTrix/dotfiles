return {
	{ "echasnovski/mini.nvim" },
	{
		"echasnovski/mini.files",
		lazy = false,
		keys = {
			{
				"<C-p>",
				function()
					require("mini.files").open()
				end,
			},
		},
		opts = {},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		keys = {
			-- Cannot setup mappings here because they need
			-- to use the same harpoon instance.
			{ "<Leader>a" },
			{ "<C-e>" },
			{ "<C-h>" },
			{ "<C-j>" },
			{ "<C-k>" },
			{ "<C-l>" },
		},
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			vim.keymap.set("n", "<Leader>a", function()
				harpoon:list():append()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<C-h>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<C-j>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<C-k>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<C-l>", function()
				harpoon:list():select(4)
			end)
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		keys = {
			{
				"<Leader>ff",
				function()
					require("telescope.builtin").git_files()
				end,
			},
			{
				"<Leader>pf",
				function()
					require("telescope.builtin").find_files()
				end,
			},
			{
				"<Leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
			},
			{
				"<Leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
			},
			{
				"<Leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
			},
		},
	},
}
