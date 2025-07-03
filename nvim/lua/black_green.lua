-- my_black_green_theme.lua

-- Clear existing highlights
vim.cmd('hi clear')

-- Set desired colors
local bg = '#000000'
local fg = '#00ff00'

-- Override all highlight groups
for hl, val in pairs(vim.api.nvim_get_hl(0, {})) do
  local new_val = {}
  if val.fg then new_val.fg = fg end
  if val.bg then new_val.bg = bg end
  if val.bold then new_val.bold = true end
  if val.italic then new_val.italic = true end
  if val.underline then new_val.underline = true end
  vim.api.nvim_set_hl(0, hl, new_val)
end

-- Custom overrides
vim.api.nvim_set_hl(0, 'Visual', { bg = '#ffffff', fg = '#000000' })

vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#002200' })

-- Track active/inactive window background
vim.api.nvim_set_hl(0, 'Normal',   { fg = '#00ff00', bg = '#000000' })  -- Active window
vim.api.nvim_set_hl(0, 'NormalNC', { fg = '#00ff00', bg = '#1c1c1c' })  -- Inactive window (gray)

-- Auto-adjust background color when switching windows
vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  callback = function()
    vim.api.nvim_set_hl(0, 'Normal',   { fg = '#00ff00', bg = '#000000' })  -- Active
    vim.api.nvim_set_hl(0, 'NormalNC', { fg = '#00ff00', bg = '#1c1c1c' })  -- Inactive
  end,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
  callback = function()
    vim.api.nvim_set_hl(0, 'NormalNC', { fg = '#00ff00', bg = '#1c1c1c' })  -- Ensure inactive stays gray
  end,
})

