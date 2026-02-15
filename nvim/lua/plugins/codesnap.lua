return {
  "mistricky/codesnap.nvim",
  build = "make",
  config = function()
    require("codesnap").setup({
      has_breadcrumbs = true, -- Show filename and line numbers
      has_line_number = true,
      bg_theme = "default", -- Available options: "moody", "sharp", "blurry"
      watermark = "Version 1.0",
    })
  end,
  keys = {
    { "<leader>s", ":CodeSnap<CR>", mode = "v", desc = "Take a code snapshot" },
  },
}
