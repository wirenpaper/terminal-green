-- Vim color scheme: terminal-green
-- Maintainer: You
-- Description: A minimal green terminal colorscheme

-- Clear any existing highlighting
vim.cmd('syntax off')
vim.cmd('highlight clear')

if vim.fn.exists('syntax_on') then
  vim.cmd('syntax reset')
end

-- Disable true color support
vim.opt.termguicolors = false

-- Set the colorscheme name
vim.g.colors_name = 'terminal-green'

-- Helper function to set highlights
local function hi(group, opts)
  local cmd = 'highlight ' .. group
  if opts.fg then cmd = cmd .. ' ctermfg=' .. opts.fg end
  if opts.bg then cmd = cmd .. ' ctermbg=' .. opts.bg end
  if opts.attr then cmd = cmd .. ' cterm=' .. opts.attr end
  vim.cmd(cmd)
end

local function link(from, to)
  vim.cmd('hi def link ' .. from .. ' ' .. to)
end

-- 1. Define the CORE styles for UI and special elements
hi('Normal', { fg = 'darkgreen', bg = 'black', attr = 'NONE' })
hi('Visual', { fg = 'black', bg = 'darkgreen', attr = 'NONE' })
hi('PmenuSel', { attr = 'underdashed' })

-- The current match under cursor - add underline only
hi('CurSearch', { bg = 'darkgreen', fg = 'black', attr = 'underdashed' })
-- IncSearch is for incremental search (while typing)
hi('IncSearch', { bg = 'darkgreen', fg = 'black', attr = 'underdashed' })
hi('Search', { bg = 'darkgreen', fg = 'black' })

-- Note: These are intentionally 'green'. Change to 'darkgreen' if you want
-- absolutely no variation anywhere.
hi('CursorLineNr', { fg = 'darkgreen', bg = 'black', attr = 'NONE' })
hi('TabLineSel', { fg = 'darkgreen', bg = 'black', attr = 'NONE' })

-- 2. Explicitly define all common SYNTAX groups to be darkgreen and NOT bold
hi('Comment', { fg = 'darkgreen', attr = 'underdotted' })
hi('Constant', { fg = 'darkgreen', attr = 'NONE' })
hi('Statement', { fg = 'darkgreen', attr = 'NONE' })
hi('Identifier', { fg = 'darkgreen', attr = 'NONE' })
hi('Function', { fg = 'darkgreen', attr = 'NONE' })
hi('Type', { fg = 'darkgreen', attr = 'NONE' })
hi('PreProc', { fg = 'darkgreen', attr = 'NONE' })
hi('Special', { fg = 'darkgreen', attr = 'NONE' })
hi('String', { fg = 'darkgreen', attr = 'NONE' })
hi('Number', { fg = 'darkgreen', attr = 'NONE' })
hi('ModeMsg', { fg = 'darkgreen', bg = 'black', attr = 'NONE' })

-- 3. Link the remaining UI groups to 'Normal'
link('NonText', 'Normal')
link('LineNr', 'Normal')
hi('StatusLine', { fg = 'darkgreen', bg = 'black', attr = 'NONE' })
hi('StatusLineNC', { fg = 'darkgreen', bg = 'black', attr = 'NONE' })
link('VertSplit', 'Normal')
link('Pmenu', 'Normal')
link('TabLine', 'Normal')
link('TabLineFill', 'Normal')
link('VisualNOS', 'Visual')
