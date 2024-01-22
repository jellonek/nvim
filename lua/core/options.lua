local opt = vim.opt

opt.wrap = false
opt.cursorline = true
opt.colorcolumn = "80"
opt.scrolloff = 3
opt.laststatus = 3
opt.expandtab = true
opt.softtabstop = 2
opt.tabstop = 2
opt.shiftwidth = 2
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
