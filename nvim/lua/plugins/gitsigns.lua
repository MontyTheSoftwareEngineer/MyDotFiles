return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local map = function(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Revert the hunk under the cursor
      map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
      -- Stage the hunk under the cursor
      map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
      -- Reset whole buffer
      map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
    end,
  },
}

