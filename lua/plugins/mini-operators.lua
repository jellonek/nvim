return {
  'echasnovski/mini.operators',
  dependencies = 'echasnovski/mini.nvim',
  config = function()
    require('mini.operators').setup()
  end
}
