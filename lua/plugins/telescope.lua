return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',

  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },

  keys = {
    { "<leader>ff",       "<cmd>Telescope find_files<cr>",           desc = 'Telescope find files' },
    { "<leader>fg",       "<cmd>Telescope live_grep<cr>",            desc = 'Telescope live grep' },
    { "<leader>fh",       "<cmd>Telescope help_tags<cr>",            desc = 'Telescope help tags' },
    { "<leader>fs",       "<cmd>Telescope lsp_document_symbols<cr>", desc = 'Telescope lists LSP document symbols in the current buffer' },
    { "<leader>fs",       "<cmd>Telescope grep_string<cr>",          desc = 'Telescope search symbol under the cursor' },
    { "<leader>qf",       "<cmd>Telescope quickfix<cr>",             desc = 'Telescope show quickfix list' },
    { "<leader>fk",       "<cmd>Telescope keymaps<cr>",              desc = 'Telescope keymaps' },
    { "<leader><leader>", "<cmd>Telescope buffers<cr>",              desc = 'Telescope buffers' },
  },

  config = function()
    local t = require('telescope')
    local builtin = require('telescope.builtin')
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
    vim.keymap.set('n', '<leader>fv', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Find file in neovim configration' })
  end

}
