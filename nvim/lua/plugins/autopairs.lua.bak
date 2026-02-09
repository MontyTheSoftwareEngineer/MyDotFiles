return {
  {
    "windwp/nvim-autopairs",
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({})

      -- Integrate with nvim-cmp
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

      -- Use Enter to jump out of pairs
      local Rule = require('nvim-autopairs.rule')
      
      vim.keymap.set('i', '<CR>', function()
        local col = vim.fn.col('.') - 1
        local line = vim.fn.getline('.')
        local next_char = line:sub(col + 1, col + 1)
        
        if next_char:match('[%)%]%}"\']') then
          return '<Esc>la'
        else
          return npairs.autopairs_cr()
        end
      end, { expr = true, noremap = true })
    end
  }
}

