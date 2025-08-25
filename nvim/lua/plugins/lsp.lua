return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Setup clangd LSP for C++
      require'lspconfig'.clangd.setup{
        on_attach = function(client, bufnr)
          local function buf_set_keymap(...) 
            vim.api.nvim_buf_set_keymap(bufnr, ...) 
          end
          local opts = { noremap=true, silent=true }

          -- Setup keybindings for LSP features
          buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)  -- Go to Definition
          buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)   -- Show References
          buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)  -- Go to Declaration
          buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)  -- Go to Implementation

          -- Optionally, setup completion with nvim-cmp
          require'cmp'.setup.buffer { enabled = true }
        end
      }

      -- Setup rust_analyzer LSP for Rust
      require'lspconfig'.rust_analyzer.setup{
        on_attach = function(client, bufnr)
          local function buf_set_keymap(...) 
            vim.api.nvim_buf_set_keymap(bufnr, ...) 
          end
          local opts = { noremap=true, silent=true }

          -- Setup keybindings for LSP features
          buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)  -- Go to Definition
          buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)   -- Show References
          buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)  -- Go to Declaration
          buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)  -- Go to Implementation

          -- Optionally, setup completion with nvim-cmp
          require'cmp'.setup.buffer { enabled = true }
        end
      }

      -- Setup marksman LSP for Markdown
      require'lspconfig'.marksman.setup{
        on_attach = function(client, bufnr)
          local function buf_set_keymap(...) 
            vim.api.nvim_buf_set_keymap(bufnr, ...) 
          end
          local opts = { noremap=true, silent=true }

          -- Setup keybindings for LSP features
          buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)  -- Go to Definition
          buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)   -- Show References
          buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)  -- Go to Declaration
          buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)  -- Go to Implementation

          -- Optionally, setup completion with nvim-cmp
          require'cmp'.setup.buffer { enabled = true }
        end
      }

      -- Diagnostics configuration (optional, disable virtual text)
      vim.diagnostic.config({ virtual_text = true })
    end,
  }
}

