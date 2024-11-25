return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    lazy = false,
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            -- Key mappings for Rust
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions, opts)
            vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, opts)
          end,
        },
      })
    end,
  },

  {
    'boganworld/crackboard.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
    config = function()
      require('crackboard').setup({
        session_key = '',
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- TypeScript/JavaScript
      lspconfig.ts_ls.setup({
        on_attach = function(client, bufnr)
          -- Disable formatting from tsserver (use eslint/prettier instead)
          client.server_capabilities.documentFormattingProvider = false

          -- Key mappings for LSP actions
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      })

      -- HTML
      lspconfig.html.setup({})
      -- CSS
      lspconfig.cssls.setup({})
      -- JSON
      lspconfig.jsonls.setup({})
      -- ESLint
      lspconfig.eslint.setup({
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
      -- Tailwind CSS
      lspconfig.tailwindcss.setup({})
      -- GraphQL
      lspconfig.graphql.setup({})
    end,
  },

  -- Treesitter for better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
        "tsx",
        "graphql",
        "bash",
        "lua",
      },
      highlight = { enable = true },
    },
  },
}
