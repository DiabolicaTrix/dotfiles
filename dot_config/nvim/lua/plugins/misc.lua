return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin-macchiato]])
        end,
    },
    {
        'jinh0/eyeliner.nvim',
        lazy = true,
        opts = {
            highlight_on_key = true,
            dim = true
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = { theme = 'palenight' },
            sections = {
                lualine_x = {
                    'encoding', 'fileformat', 'filetype'
                }
            }
        },
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },
    'tpope/vim-sensible',
    'tpope/vim-surround',
    'tpope/vim-endwise',
    'tpope/vim-sleuth',
    'tpope/vim-commentary',
    {'windwp/nvim-autopairs', opts = {}},
}

-- -- Misc
-- local lazygit = require('lazygit')
-- vim.keymap.set("n", "<Leader>gg", lazygit.lazygit, {})
