local M = {}

function M.apply(colors)
  -- 1. LIFECYCLE
  vim.cmd('highlight clear')
  if vim.fn.exists('syntax_on') then vim.cmd('syntax reset') end
  vim.g.colors_name = 'terminal-green'

  -- 2. HELPER FUNCTIONS
  local function hi(group, opts)
    local cmd = 'highlight! ' .. group 
    if opts.fg then cmd = cmd .. ' ctermfg=' .. opts.fg .. ' guifg=' .. opts.fg end
    if opts.bg then cmd = cmd .. ' ctermbg=' .. opts.bg .. ' guibg=' .. opts.bg end
    if opts.attr then 
      cmd = cmd .. ' cterm=' .. opts.attr .. ' gui=' .. opts.attr 
    end
    vim.cmd(cmd)
  end

  local function link(from, to)
    vim.cmd('hi! link ' .. from .. ' ' .. to)
  end

  -- 3. UNPACK COLORS
  local m = colors.mcolor
  local bm = colors.bmcolor
  local cmt = colors.comment
  local vis_fg = colors.visual_fg -- This is "0" in Dark Mode
  local vis_bg = colors.visual_bg

  -- 4. CORE STYLES
  hi('Normal', { fg = m, bg = bm, attr = 'NONE' })
  hi('Visual', { fg = vis_fg, bg = vis_bg, attr = 'NONE' })
  
  vim.api.nvim_set_hl(0, 'TabKeyLetter', { underdashed = true, })
  vim.api.nvim_set_hl(0, 'TabKeyLetter2', { underdashed = true, })

  hi('TabLine',     { fg = m, bg = bm, attr = 'underdashed' })
  hi('TabLineFill', { fg = m, bg = bm, attr = 'underdashed' })
  hi('TabLineSel',  { fg = m, bg = bm, attr = 'underdashed' })


  -- Pmenu Selection (The item you are hovering)
  -- We use vis_fg (0) so you can see the text against the line
  hi('PmenuSel', { fg = vis_fg, bg = vis_bg, attr = 'underdashed' })

  -- Search
  hi('CurSearch', { bg = m, fg = vis_fg, attr = 'underdashed' })
  hi('IncSearch', { bg = vis_bg, fg = vis_fg, attr = 'underdashed' })
  hi('Search',    { bg = m, fg = vis_fg })

  -- 6. REVERSED UI ELEMENTS (Popups & Menus)
  -- HERE IS THE FIX: Use vis_fg (which is "0") instead of bm (NONE)
  -- Dark Mode Result: Foreground=0 (Black), Background=214 (Orange)
  hi('Pmenu',       { fg = vis_fg, bg = vis_bg, attr = 'NONE' }) 
  hi('NormalFloat', { fg = vis_fg, bg = m, attr = 'NONE' })
  hi('FloatBorder', { fg = vis_fg, bg = m, attr = 'NONE' })

  -- Other UI
  hi('CursorLineNr', { fg = m, bg = bm, attr = 'NONE' })
  hi('StatusLine',   { fg = m, bg = bm, attr = 'NONE' })
  hi('StatusLineNC', { fg = m, bg = bm, attr = 'NONE' })
  hi('ModeMsg',      { fg = m, bg = bm, attr = 'NONE' })

  -- 7. SYNTAX
  hi('Comment', { fg = cmt })
  
  local groups = { 'Constant', 'Statement', 'Identifier', 'Function', 
                   'Type', 'PreProc', 'Special', 'String', 'Number' }
  for _, g in ipairs(groups) do
    hi(g, { fg = m, attr = 'NONE' })
  end

  -- 8. LINKS
  link('NonText', 'Normal')
  link('LineNr', 'Normal')
  link('VertSplit', 'Normal')
  link('VisualNOS', 'Visual')

  -- 9. TREESITTER FIXES
  link('@comment', 'Comment')
  link('@lsp.type.comment', 'Comment')
end

return M
