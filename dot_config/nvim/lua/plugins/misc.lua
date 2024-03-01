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
        }
    },
    {"nvim-lua/plenary.nvim", lazy = true},
    {'nvim-tree/nvim-web-devicons', lazy = true},
    'tpope/vim-sensible',
    'tpope/vim-surround',
    'tpope/vim-endwise',
    'tpope/vim-sleuth',
    'tpope/vim-commentary',
    { 'windwp/nvim-autopairs', opts = {} },
    { 'kdheepak/lazygit.nvim', cmd = "LazyGit", keys = { { "<Leader>gg", function() require('lazygit').lazygit() end } } }
}
