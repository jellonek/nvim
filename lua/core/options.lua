local opt = vim.opt

opt.wrap = false
opt.cursorline = true
opt.colorcolumn = "80"
opt.scrolloff = 3
opt.laststatus = 3
opt.expandtab = false
opt.softtabstop = 4
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.mouse = "a"
opt.background = "dark"

opt.numberwidth = 2
opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true
opt.signcolumn = "yes"
opt.termguicolors = true

-- no welcome message
opt.shortmess:append "sI"

opt.swapfile = false
