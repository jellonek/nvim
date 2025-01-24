return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  dependencies = { "echasnovski/mini.icons" },
  keys = {
    { "-",         "<cmd>Oil<cr>",                               desc = "Oil open parent directory" },
    { "<leader>o", "<cmd>lua require('oil').toggle_float()<cr>", desc = "Oil open float window" },
  },
}
