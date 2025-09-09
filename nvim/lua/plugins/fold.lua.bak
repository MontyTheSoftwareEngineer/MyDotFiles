-- lua/plugins/fold.lua
return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "BufReadPost",
  config = function()
    vim.o.foldcolumn = "1" -- '0' is default, '1' shows fold column
    vim.o.foldlevel = 99   -- ensures folds are open
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    require("ufo").setup({
      provider_selector = function(_, _, _)
        return { "treesitter", "indent" }
      end
    })
  end
}

