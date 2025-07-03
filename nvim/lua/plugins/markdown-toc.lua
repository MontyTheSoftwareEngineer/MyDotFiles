return {
  -- Plugin for generating a Table of Contents in Markdown files
  {
    'mzlogin/vim-markdown-toc',
    config = function()
      -- Optional: Configuration for vim-markdown-toc
      vim.g.vim_markdown_toc_autofit = 1  -- Automatically adjust TOC width
      vim.g.vim_markdown_toc_tasklist = 1  -- Use task list style for TOC (checkboxes)
    end,
  },

  -- You can add more plugins here as needed
}

