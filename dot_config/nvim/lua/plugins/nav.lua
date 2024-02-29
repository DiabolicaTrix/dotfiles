return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        keys = {"<Leader>a", "<C-e>", "<C-h>", "<C-j>", "<C-k>", "<C-l>"},
        config = function()
            local harpoon = require("harpoon")

            harpoon:setup()

            vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
        end,
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        keys = {'<Leader>ff'},
        config = function()
            -- Telescope
            local telescope = require('telescope.builtin')
            vim.keymap.set('n', '<Leader>ff', telescope.git_files, {})
            vim.keymap.set('n', '<Leader>pf', telescope.find_files, {})
            vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
            vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
            vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons'
        }
    },
}
