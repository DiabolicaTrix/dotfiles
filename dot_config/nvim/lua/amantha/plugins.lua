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
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use {
        'ms-jpq/coq.artifacts',
        branch = 'artifacts',
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'towolf/vim-helm' -- Helm not working properly with treesitter so using a custom plugin

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
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Text Editing
    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'tpope/vim-endwise'
    use 'tpope/vim-fugitive'

    -- Coding
    use 'github/copilot.vim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
