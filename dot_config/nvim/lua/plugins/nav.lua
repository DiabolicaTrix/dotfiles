return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        keys = {
            { "<Leader>a", function() require("harpoon"):list().append() end },
            { "<C-e>",
                function()
                    local harpoon = require("harpoon")
                    harpoon:toggle_quick_menu(harpoon:list())
                end
            },
            { "<C-h>",     function() require("harpoon"):list().select(1) end },
            { "<C-j>",     function() require("harpoon"):list().select(2) end },
            { "<C-k>",     function() require("harpoon"):list().select(3) end },
            { "<C-l>",     function() require("harpoon"):list().select(4) end }
        },
        config = function() require("harpoon"):setup() end,
    },
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        keys = {
            {"<Leader>ff", function() require('telescope.builtin').git_files() end},
            {"<Leader>pf", function() require('telescope.builtin').find_files() end},
            {"<Leader>fg", function() require('telescope.builtin').live_grep() end},
            {"<Leader>fb", function() require('telescope.builtin').buffers() end},
            {"<Leader>fh", function() require('telescope.builtin').help_tags() end},
        },
    },
}
