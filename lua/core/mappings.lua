local g = vim.g

g.mapleader = '\\'
g.maplocalleader = '\\'

local keymap = vim.keymap

-- remap jj in insert mode to ESC
keymap.set("i", "jj", "<Esc>")

-- moving visually selected block
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- clipboard simplification
keymap.set({"n", "v"}, "<leader>y", '"+y')
keymap.set({"n", "v"}, "<leader>p", '"+p')
