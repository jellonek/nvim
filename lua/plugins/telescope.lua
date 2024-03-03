return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',

  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },

  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>" },
    { "<leader>qf", "<cmd>Telescope quickfix<cr>" },
  },

  config = function()
    local t = require('telescope')
    t.setup {
      extensions = {
        fzf = {
          native = true,
          override_generic_sorter = true,
          override_file_sorter = true,
        }
      }
    }
    t.load_extension('fzf')
  end

}
