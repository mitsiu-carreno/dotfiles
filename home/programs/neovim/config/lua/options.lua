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
-- Automatically inserts an extra level of indentation in some cases
-- vim.opt.smartindent = true
-- Remove trailing whitespace on save (except in markdown)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "markdown" then
      vim.cmd([[silent! %s/\s\+$//e]])
    end
  end,
})

-- Search
-- Case-insensitive by default
vim.opt.ignorecase = true
-- Overrides ignorecase if patter contains uppercase
vim.opt.smartcase = true
