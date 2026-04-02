-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Display
-- At least 8 linex of context visible above and below
vim.opt.scrolloff = 8
-- Enables 24-bit RGB
vim.opt.termguicolors = true

-- Identation
-- <Tab> appears as 2 space wide 
vim.opt.tabstop = 2
-- Auto-indent shift by 2 spaces
vim.opt.shiftwidth = 2
-- <Tab> insert spaces
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
-- Case-insensitive by default
vim.opt.ignorecase = true
-- Overrides ignorecase if patter contains uppercase
vim.opt.smartcase = true
