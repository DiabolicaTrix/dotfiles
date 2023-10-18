require("dapui").setup()
require('dap-go').setup()
require("nvim-dap-virtual-text").setup()

vim.keymap.set('n', '<Leader>d', function() require('dapui').open() end)
vim.keymap.set('n', '<Leader>dc', function()
  if vim.fn.filereadable('.vscode/launch.json') then
    require('dap.ext.vscode').load_launchjs()
  end  
  require('dap').continue()  
end)
vim.keymap.set('n', '<Leader>do', function() require('dap').step_over() end)
vim.keymap.set('n', '<Leader>di', function() require('dap').step_into() end)
vim.keymap.set('n', '<Leader>dout', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>dlp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

local dap, dapui = require('dap'), require('dapui')

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

