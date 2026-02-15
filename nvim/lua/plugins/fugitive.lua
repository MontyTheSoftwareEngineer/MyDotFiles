return {
  "tpope/vim-fugitive",
  dependencies = {
    -- Adds :GBrowse (open repo links) and nicer GitHub integration for fugitive
    "tpope/vim-rhubarb",
  },
  cmd = {
    "Git",
    "G",
    "Gdiffsplit",
    "Gvdiffsplit",
    "Gedit",
    "Gread",
    "Gwrite",
    "Gclog",
    "Gblame",
    "Gitsigns", -- not from fugitive, harmless if typed; ignore if you don't use it
    "GBrowse",
  },
  config = function()
    -- Small quality-of-life: better defaults inside fugitive buffers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "fugitive", "fugitiveblame" },
      callback = function()
        -- Don't let fugitive buffers pollute your buffer list
        vim.opt_local.buflisted = false
        -- Keep it simple
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
      end,
    })

    -- Convenience: close common fugitive windows with q
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "fugitive", "fugitiveblame", "git" },
      callback = function()
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true, silent = true })
      end,
    })
  end,

}

