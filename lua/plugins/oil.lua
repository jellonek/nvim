return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {"-", "<cmd>Oil<cr>", { desc = "Open parent directory" } },
    {"<leader>o", "<cmd>lua require('oil').toggle_float()<cr>", { desc = "Open float window" } },
  },
}
