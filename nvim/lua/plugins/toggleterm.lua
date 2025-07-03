return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 10
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        persist_size = true,
        direction = "float",
        float_opts = {
          border = "curved",
          winblend = 10,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })

      -- Define a terminal instance
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end

      -- 🔹 Manually set keybindings (No more `open_mapping` conflicts)
      vim.api.nvim_set_keymap("n", "<leader>t", ":ToggleTerm<CR>", { noremap = true, silent = true }) -- Open terminal in Normal mode only
      vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true }) -- Open LazyGit

      -- Optional: Close terminal with `<Esc>` in Terminal mode
      vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true }) -- Exit terminal mode
    end,
  }
}

