
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use {
    'ms-jpq/coq.artifacts',
    branch = 'artifacts',
  }  
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use { 
    'ms-jpq/chadtree',
    branch = 'chad',
    run = 'python3 -m chadtree deps'
  }

  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  -- Theming
  use 'drewtempelmeyer/palenight.vim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  } 

  -- Specific languages
  use 'fatih/vim-go'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

