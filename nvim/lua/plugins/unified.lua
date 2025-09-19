return {
  "axkirillov/unified.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  cmd = { "Unified" },
  keys = {
    {
      "<leader>G",
      "<cmd>Unified<cr>",
      desc = "Open Unified diff viewer",
    },
  },
  opts = {},
  config = function(_, opts)
    require("unified").setup(opts)

    -- Additions: white text on green background
    vim.api.nvim_set_hl(0, "UnifiedAdd", { fg = "#ffffff", bg = "#008000" })
    vim.api.nvim_set_hl(0, "DiffAdd",    { fg = "#ffffff", bg = "#008000" })

    -- Deletions: white text on red background
    vim.api.nvim_set_hl(0, "UnifiedDelete", { fg = "#ffffff", bg = "#800000" })
    vim.api.nvim_set_hl(0, "DiffDelete",    { fg = "#ffffff", bg = "#800000" })
  end,
}

