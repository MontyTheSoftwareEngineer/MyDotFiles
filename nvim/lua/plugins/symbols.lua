return {
  "simrat39/symbols-outline.nvim",
  config = function()
    require("symbols-outline").setup({
      show_numbers = true,  -- Show absolute line numbers
      show_relative_numbers = true, -- Show relative numbers (for quick jumps)
    })
  end
}

