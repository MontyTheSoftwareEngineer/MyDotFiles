return {
  "Eandrju/cellular-automaton.nvim",
  config = function()
    vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Make It Rain" })
    vim.keymap.set("n", "<leader>gl", "<cmd>CellularAutomaton game_of_life<CR>", { desc = "Game of Life" })
  end,
}

