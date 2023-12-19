local configs = require('lspconfig.configs')
local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

vim.g.coq_settings = {
  auto_start = 'shut-up',
}
local coq = require "coq"

lspconfig.pyright.setup(coq.lsp_ensure_capabilities())
lspconfig.tsserver.setup(coq.lsp_ensure_capabilities())
lspconfig.gopls.setup(coq.lsp_ensure_capabilities())
--lspconfig.yamlls.setup {}
lspconfig.helm_ls.setup(coq.lsp_ensure_capabilities())
lspconfig.terraformls.setup(coq.lsp_ensure_capabilities())
lspconfig.dockerls.setup{coq.lsp_ensure_capabilities()}
require'lspconfig'.groovyls.setup{
    -- Unix
    cmd = { "java", "-jar", "~/.scripts/groovy-language-server-all.jar" },
    coq.lsp_ensure_capabilities()
}


vim.keymap.set('n', '[e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '[q', vim.diagnostic.setloclist)
vim.keymap.set('n', '<Leader>fd', ':Telescope diagnostics<CR>')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<Leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<Leader>gD', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<Leader>bf', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- Aerial
require('aerial').setup({
  on_attach = function(bufnr)
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end
})

vim.keymap.set('n', '<leader>s', '<cmd>AerialToggle!<CR>')
