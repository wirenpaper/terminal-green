-- ~/.config/nvim/colors/dark.lua

local palette = {
  mcolor = "214",
  bmcolor = "NONE",
  comment = "darkred",
  visual_fg = "0",
  visual_bg = "214"
}

local logic_file = vim.fn.stdpath('config') .. '/colors/theme_logic.lua'
dofile(logic_file).apply(palette)
