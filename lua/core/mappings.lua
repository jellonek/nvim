local g = vim.g

g.mapleader = '\\'
g.maplocalleader = '\\'

local keymap = vim.keymap

-- remap jj in insert mode to ESC
keymap.set("i", "jj", "<Esc>", { desc = "Use jj in insert mode as ESC"} )

-- moving visually selected block
keymap.set("v", "<", "<gv", { desc = "De-indent selected block" })
keymap.set("v", ">", ">gv", { desc = "Indent selected block" })

-- clipboard simplification
keymap.set({"n", "v"}, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
keymap.set({"n", "v"}, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- buffers swapping
keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
