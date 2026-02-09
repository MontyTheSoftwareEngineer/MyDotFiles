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
  keys = {
    -- Status (the one you live in)
    { "<leader>gs", "<cmd>Git<cr>", desc = "Git status (Fugitive)" },

    -- Diff workflows
    { "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Git diff (3-way vs index/HEAD)" },
    { "<leader>gD", "<cmd>Gdiffsplit<cr>", desc = "Git diff (horizontal split)" },

    -- Blame
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame (Fugitive)" },

    -- Log
    { "<leader>gl", "<cmd>Git log --oneline --decorate --graph --all<cr>", desc = "Git log graph" },
    { "<leader>gL", "<cmd>Gclog<cr>", desc = "Git log for current file (Gclog)" },

    -- Quick push/pull (useful when you just want it done)
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
    { "<leader>gP", "<cmd>Git pull --rebase<cr>", desc = "Git pull --rebase" },

    -- Commit
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
    { "<leader>gC", "<cmd>Git commit --amend<cr>", desc = "Git commit --amend" },

    -- Browse remote (requires vim-rhubarb; works best on GitHub)
    { "<leader>go", "<cmd>GBrowse<cr>", desc = "Open on remote (GBrowse)" },
    { "<leader>gO", "<cmd>GBrowse!<cr>", desc = "Copy remote URL (GBrowse!)" },

    -- Inside fugitive status: stage/unstage, etc are built-in:
    --   - on a file: "-" toggles stage
    --   - "cc" commit, "ca" amend, "P" push, "pp" pull, "=" diff, "dd" diff split, etc.
  },
}

