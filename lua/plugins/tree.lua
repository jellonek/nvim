return {
  "nvim-tree/nvim-tree.lua",
  enabled = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },

  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      git = {
        ignore = true
      }
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = 'Toggle file browser' })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = 'Refresh file browser' })
  end
}
