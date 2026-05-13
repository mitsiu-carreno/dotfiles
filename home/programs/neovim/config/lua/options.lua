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

-- %:p reference :help filename-modifiers
if vim.fn.expand('%:p'):match('upa') then
  vim.cmd.colorscheme("mfd-mono")
  vim.opt.relativenumber = false
else
  local light_themes = {
    'mfd', 'mfd-paper', 'mfd-flir-bh', 'mfd-gbl-light',
  };

  local dark_themes = {
    'mfd-dark', 'mfd-stealth', 'mfd-amber', 'mfd-mono',
    'mfd-scarlet', 'mfd-hud', 'mfd-nvg', 'mfd-blackout',
    'mfd-flir', 'mfd-flir-rh', 'mfd-flir-fusion',
    'mfd-gbl-dark', 'mfd-lumon', 'mfd-nerv'
  }

  local themes = {}

  vim.list_extend(themes, dark_themes)
  -- vim.list_extend(themes, light_themes)

  math.randomseed(os.time())
  local chosen = themes[math.random(#themes)]

  require('mfd').setup({
    bright_comments = true,  -- helps readability due to transparency
  });

  vim.cmd('colorscheme ' .. chosen)
  vim.notify('mfd: ' .. chosen, vim.log.levels.INFO)
end
