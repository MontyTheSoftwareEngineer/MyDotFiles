return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    
    wk.setup({
      preset = "modern",
    })

    -- Register keybinds with descriptions
    wk.add({
      -- Leader key groups
      { "<leader>p", desc = "Toggle Neotree" },
      { "<leader>o", desc = "Toggle Symbols Outline" },
      { "<leader>y", desc = "Copy to clipboard", mode = { "n", "v" } },
      
      -- Buffer management
      { "<leader>b", group = "Buffer" },
      { "<leader>bl", desc = "Pick Buffer" },
      { "<leader>bd", desc = "Delete Buffer" },
      
      -- Telescope
      { "<leader>k", desc = "Find Files" },
      { "<leader>g", desc = "Live Grep" },
      { "<leader>s", desc = "Fuzzy Find in Buffer" },
      
      -- Window resizing (Alt key)
      { "<A-h>", desc = "Decrease Window Width" },
      { "<A-l>", desc = "Increase Window Width" },
      { "<A-j>", desc = "Increase Window Height" },
      { "<A-k>", desc = "Decrease Window Height" },
      
      -- Visual mode indent
      { ">", desc = "Indent (keep selection)", mode = "x" },
      { "<", desc = "Unindent (keep selection)", mode = "x" },
      
      -- Move.nvim (normal mode)
      { "K", desc = "Move Line Up", mode = "n" },
      { "J", desc = "Move Line Down", mode = "n" },
      
      -- Move.nvim (visual mode)
      { "K", desc = "Move Block Up", mode = "v" },
      { "J", desc = "Move Block Down", mode = "v" },
      
      -- CodeSnap
      { "<leader>s", desc = "Take Code Snapshot", mode = "v" },
      
      -- Which-key helper
      { "<leader>?", desc = "Buffer Local Keymaps" },
    })
  end,
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
