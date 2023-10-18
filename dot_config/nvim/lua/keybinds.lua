function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<Leader>n', ':CHADopen<CR>')
map('n', '<A-Left>', ':bp<CR>')
map('n', '<A-Right>', ':bn<CR>')
map('n', '<A-CR>', ':GoDef<CR>')
map('n', '<A-Up>', ':wincmd w<CR>')

-- Resizing
vim.keymap.set('n', '<C-<>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C->>', ':vertical resize +2<CR>')

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-CR>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

