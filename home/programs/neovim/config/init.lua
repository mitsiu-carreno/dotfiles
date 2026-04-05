require("options")
require("keymaps")

local light_themes = {
  'mfd', 'mfd-paper', 'mfd-flir-bh', 'mfd-gbl-light',
};

local dark_themes = {
  'mfd-dark', 'mfd-stealth', 'mfd-amber', 'mfd-mono',
  'mfd-scarlet', 'mfd-hud', 'mfd-nvg', 'mfd-blackout',
  'mfd-flir', 'mfd-flir-rh', 'mfd-flir-fusion', 'mfd-gbl-dark', 'mfd-lumon'
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

vim.opt.guicursor = {
  "n:block-CursorNormal",
  "v:block-CursorVisual",
  "i:block-CursorInsert",
  "r-cr:block-CursorReplace",
  "c:block-CursorCommand",
}
require('mfd').enable_cursor_sync()

vim.notify('mfd: ' .. chosen, vim.log.levels.INFO)
