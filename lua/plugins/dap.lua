return {
  "mfussenegger/nvim-dap",

  config = function()
    local dap = require("dap")

    local keymap = vim.keymap
    keymap.set('n', '<F5>', function() dap.continue() end)
    keymap.set('n', '<F10>', function() dap.step_over() end)
    keymap.set('n', '<F11>', function() dap.step_into() end)
    keymap.set('n', '<F12>', function() dap.step_out() end)
    keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
    keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
    keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
    keymap.set('n', '<Leader>dl', function() dap.run_last() end)
    local widgets = require('dap.ui.widgets')
    keymap.set({'n', 'v'}, '<Leader>dh', function()
      widgets.hover()
    end)
    keymap.set({'n', 'v'}, '<Leader>dp', function()
      widgets.preview()
    end)
    keymap.set('n', '<Leader>df', function()
      widgets.centered_float(widgets.frames)
    end)
    keymap.set('n', '<Leader>ds', function()
      widgets.centered_float(widgets.scopes)
    end)
  end
}
