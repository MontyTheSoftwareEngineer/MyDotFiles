vim.opt.nu = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.opt.autoread = true

vim.keymap.set("n", "j", "jzz", { noremap = true })
vim.keymap.set("n", "k", "kzz", { noremap = true })

vim.keymap.set('n', '<leader>p', ':Neotree toggle<CR>', {})
vim.keymap.set('n', '<leader>o', ':SymbolsOutline<CR>', { noremap = true, silent = true, desc = 'Toggle Symbols Outline' })
vim.keymap.set({'n','v'}, '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Copy to clipboard' })

vim.keymap.set("n", "<leader>bl", ":BufferLinePick<CR>", { noremap = true, silent = true }) -- Pick a buffer
vim.keymap.set("n", "<leader>bd", ":BufferLinePickClose<CR>", { noremap = true, silent = true }) -- Delete buffer

-- Map the ">" key to indent the selected lines in visual mode
vim.api.nvim_set_keymap('x', '>', '>gv', { noremap = true, silent = true })
-- Optionally, map "<" for un-indenting if you want the same behavior
vim.api.nvim_set_keymap('x', '<', '<gv', { noremap = true, silent = true })

-- Resize splits with Alt + h/j/k/l
vim.keymap.set("n", "<A-h>", "<cmd>vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-l>", "<cmd>vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", "<cmd>resize +1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", "<cmd>resize -1<CR>", { noremap = true, silent = true })


vim.g.wiki_root = '~/Documents/HiFam/'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

local opts = {}

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
--
-- -- Basic groups
vim.api.nvim_set_hl(0, "Normal",           { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "Cursor",           { fg = colors.bg, bg = colors.cursor })
vim.api.nvim_set_hl(0, "Visual",           { fg = colors.sel_fg, bg = colors.sel_bg })
vim.api.nvim_set_hl(0, "CursorLine",       { bg = "#1a1a1a" })
vim.api.nvim_set_hl(0, "CursorColumn",     { bg = "#1a1a1a" })
vim.api.nvim_set_hl(0, "LineNr",           { fg = colors.color8 })
vim.api.nvim_set_hl(0, "Comment",          { fg = colors.color8, italic = true })
--
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
vim.api.nvim_set_hl(0, "NormalNC", { fg = colors.fg, bg = "#2a2a2a" })
--require ("black_green")
require("lazy").setup("plugins")
