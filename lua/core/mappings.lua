local g = vim.g

g.mapleader = '\\'
g.maplocalleader = '\\'

local keymap = vim.keymap

-- remap jj in insert mode to ESC
keymap.set("i", "jj", "<Esc>", { desc = "Use jj in insert mode as ESC" })

-- moving visually selected block
keymap.set("v", "<", "<gv", { desc = "De-indent selected block" })
keymap.set("v", ">", ">gv", { desc = "Indent selected block" })

-- clipboard simplification
keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- buffers swapping
keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- quiting/saving
keymap.set("n", "<leader>z", "<cmd>wqa<cr>", { desc = "Quit with saving", silent = false })
keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit", silent = false })
keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save changes from current buffer", silent = false })

-- quickfix
keymap.set("n", "<leader>cn", "<cmd>cnext<cr>", { desc = "Jump to next quickfix item" })
keymap.set("n", "<leader>cp", "<cmd>cprevious<cr>", { desc = "Jump to previous quickfix item" })
keymap.set("n", "<leader>co", "<cmd>copen<cr>", { desc = "Open quickfix buffer" })
keymap.set("n", "<leader>cc", "<cmd>cclose<cr>", { desc = "Close quickfix buffer" })

-- "open" WORD under the cursor, e.g. open an url in a browser
keymap.set("n", "<leader>gx", "<cmd>sil !open <cWORD><cr>", { desc = "Open current WORD", silent = true })
