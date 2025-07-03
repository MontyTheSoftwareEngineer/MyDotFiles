return {
  "shortcuts/no-neck-pain.nvim",
  opts = {
    width = 80, -- Width of the centered text area
    buffers = {
      scratchPad = {
        enabled = true,
      },
    },
  },
  keys = {
    {
      "<leader>c",
      function()
        require("no-neck-pain").toggle()
      end,
      desc = "Toggle NoNeckPain",
    },
  },
}

