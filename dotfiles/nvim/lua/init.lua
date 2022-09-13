local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('plugins')
require('lsp')
require('lualine').setup {
  options = { theme  = 'palenight' }
}

require('nvim-treesitter.configs').setup {
  auto_install = true,
}

vim.g.coq_settings = {
  auto_start = 'shut-up',
}

-- LSP
require'lspconfig'.gopls.setup{}

require('coq')
require('keybinds')


