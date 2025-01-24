local api = vim.api
local opt = vim.opt

api.nvim_create_autocmd('TermOpen', {
  group = api.nvim_create_augroup('defaults-term-open', { clear = true }),
  callback = function()
    opt.number = false
    opt.relativenumber = false
  end,
})
