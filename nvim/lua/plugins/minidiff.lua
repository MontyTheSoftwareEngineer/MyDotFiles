return {
  "echasnovski/mini.diff",
  version = "*",
  config = function()
    require("mini.diff").setup({
      view = {
        style = "sign", -- or "inline", "number"
      },
      mappings = {
        apply = 'ga',
        reset = 'gr',
        toggle = 'gtd',
      },
      hooks = {
        attach = function(buf_id)
          return vim.bo[buf_id].buftype == ''
        end,
      },
    })

    vim.keymap.set("n", "<leader>d", function()
  local buf = vim.api.nvim_get_current_buf()
  local mdiff = require("mini.diff")
  mdiff.enable(buf)

  -- Delay toggle to give time for the enable hook
  vim.defer_fn(function()
    mdiff.toggle_overlay(buf)
  end, 20)  -- 20ms delay
end, { desc = "Toggle MiniDiff overlay" })

  end,
}

