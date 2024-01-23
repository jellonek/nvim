return {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',

  dependencies = { 'nvim-lua/plenary.nvim' },

  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>" },
    { "<leader>qf", "<cmd>Telescope quickfix<cr>" },
  }
}
