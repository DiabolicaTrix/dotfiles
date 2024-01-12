vim.g.mapleader = " "

-- Text Movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Window Movement
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Resizing
vim.keymap.set('n', '<C-<>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C->>', ':vertical resize +2<CR>')

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', telescope.git_files, {})
vim.keymap.set('n', '<Leader>pf', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})

-- Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-CR>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Clipboard
vim.api.nvim_set_keymap("v", "<Leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>Y", '"+yg_', { noremap = true })

vim.api.nvim_set_keymap("v", "<Leader>p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("v", "<Leader>P", '"+P', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>P", '"+P', { noremap = true })

-- Disable Arrow Keys
for _, mode in pairs({ 'n', 'i', 'v', 'x' }) do
    for _, key in pairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
        vim.keymap.set(mode, key, '<nop>')
    end
end
