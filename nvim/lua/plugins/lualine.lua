return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- This is the actual Vim feature (the lualine part below just displays it)
      vim.o.showcmd = true

      local function showcmd_component()
        -- Built-in Vim/Neovim function that returns pending commands/counts like "22"
        local sc = vim.fn.showcmd()
        if sc == nil or sc == "" then
          return ""
        end
        return sc
      end

      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {},
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { { "filename", path = 1 } },
          lualine_c = {},

          lualine_x = {
            -- 👇 shows partial command like "22" while you type "22G"
            { showcmd_component },

            {
              "diagnostics",
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
            },
          },

          lualine_y = {
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = " " },
            },
            "branch",
          },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = { { "filename", path = 1 } },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        tabline = {},
        extensions = { "nvim-tree", "quickfix", "fugitive", "neo-tree" },
      })
    end,
  },
}

