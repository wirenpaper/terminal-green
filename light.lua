-- ~/.config/nvim/colors/light.lua

local palette = {
  mcolor = "0",
  bmcolor = "223",
  comment = "88",
  visual_fg = "223",
  visual_bg = "0"
}

local logic_file = vim.fn.stdpath('config') .. '/colors/theme_logic.lua'
dofile(logic_file).apply(palette)
