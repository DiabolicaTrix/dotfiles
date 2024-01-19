vim.cmd [[packadd packer.nvim]]



return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            vim.g.coq_settings = {
                auto_start = "shut-up",
                keymap = {
                    jump_to_mark = "<C-s>",
                    bigger_preview = "<C-o>",
                }
            }
        end
    }
    use {
        'ms-jpq/coq.artifacts',
        branch = 'artifacts',
    }
    use {
        'ms-jpq/coq.thirdparty',
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'towolf/vim-helm' -- Helm not working properly with treesitter so using a custom plugin
    use 'nvimtools/none-ls.nvim'

    -- Debugging
    use 'mfussenegger/nvim-dap'
    use 'theHamsta/nvim-dap-virtual-text'
    use {
        'rcarriga/nvim-dap-ui',
        requires = 'mfussenegger/nvim-dap'
    }
    use 'leoluz/nvim-dap-go'

    -- Navigation
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' }, { 'kyazdani42/nvim-web-devicons', opt = true } }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- Theming
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            vim.cmd("colorscheme catppuccin-macchiato")
        end
    }

    -- Text Editing
    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'tpope/vim-endwise'
    use 'tpope/vim-fugitive'

    -- Coding
    use {
        'github/copilot.vim',
        config = function()
            vim.g.copilot_filetypes = {
                ["*"] = false,
            }
        end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
