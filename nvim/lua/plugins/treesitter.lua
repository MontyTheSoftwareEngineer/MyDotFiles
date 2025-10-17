return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "cpp", "qmljs", "lua", "java", "javascript", "markdown", "markdown_inline", "rust" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  }
}

