-- colors/mytheme.lua

local M = {}

function M.setup()
  vim.cmd("highlight clear")
  vim.o.background = "dark"
  vim.o.termguicolors = true

  local colors = {
    bg     = "#000000",
    fg     = "#ffffff",
    cursor = "#ffffff",

    color0  = "#868686",
    color1  = "#ff6600",
    color2  = "#ccff04",
    color3  = "#ffcc00",
    color4  = "#44b3cc",
    color5  = "#9933cc",
    color6  = "#44b3cc",
    color7  = "#f4f4f4",
    color8  = "#545454",
    color9  = "#ff0000",
    color10 = "#00ff00",
    color11 = "#ffff00",
    color12 = "#0000ff",
    color13 = "#ff00ff",
    color14 = "#00ffff",
    color15 = "#e5e5e5",

    sel_bg = "#b4d5ff",
    sel_fg = "#000000",
  }

  -- Basic groups
  vim.api.nvim_set_hl(0, "Normal",           { fg = colors.fg, bg = colors.bg })
  vim.api.nvim_set_hl(0, "Cursor",           { fg = colors.bg, bg = colors.cursor })
  vim.api.nvim_set_hl(0, "Visual",           { fg = colors.sel_fg, bg = colors.sel_bg })
  vim.api.nvim_set_hl(0, "CursorLine",       { bg = "#1a1a1a" })
  vim.api.nvim_set_hl(0, "CursorColumn",     { bg = "#1a1a1a" })
  vim.api.nvim_set_hl(0, "LineNr",           { fg = colors.color8 })
  vim.api.nvim_set_hl(0, "Comment",          { fg = colors.color8, italic = true })

  -- Syntax highlighting
  vim.api.nvim_set_hl(0, "Identifier",       { fg = colors.color5 })
  vim.api.nvim_set_hl(0, "Function",         { fg = colors.color4 })
  vim.api.nvim_set_hl(0, "Statement",        { fg = colors.color1 })
  vim.api.nvim_set_hl(0, "Keyword",          { fg = colors.color1 })
  vim.api.nvim_set_hl(0, "Constant",         { fg = colors.color3 })
  vim.api.nvim_set_hl(0, "String",           { fg = colors.color2 })
  vim.api.nvim_set_hl(0, "Number",           { fg = colors.color11 })
  vim.api.nvim_set_hl(0, "Type",             { fg = colors.color6 })
  vim.api.nvim_set_hl(0, "Special",          { fg = colors.color13 })

  -- UI Elements
  vim.api.nvim_set_hl(0, "StatusLine",       { fg = colors.fg, bg = colors.color0 })
  vim.api.nvim_set_hl(0, "VertSplit",        { fg = colors.color8 })
  vim.api.nvim_set_hl(0, "Pmenu",            { fg = colors.fg, bg = colors.color0 })
  vim.api.nvim_set_hl(0, "PmenuSel",         { fg = colors.sel_fg, bg = colors.sel_bg })
  vim.api.nvim_set_hl(0, "NormalNC",         { fg = colors.fg, bg = "#2a2a2a" })
end

return M

