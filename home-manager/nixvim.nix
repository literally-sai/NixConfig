{
  programs.nixvim = {
    # Enable NixVim and set it as the default editor
    enable = true;
    defaultEditor = true;

    # Set global variables (leader keys and nerd font support)
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;
    };

    # General Neovim options
    opts = {
      number = true;              # Show line numbers
      relativenumber = true;      # Enable relative line numbers
      tabstop = 2;                # 2 spaces for tabs
      softtabstop = 2;
      showtabline = 2;            # Always show tabline
      expandtab = true;           # Use spaces instead of tabs
      showmode = false;           # Hide mode (handled by statusline)
      clipboard = {
        providers = {
          "wl-copy".enable = true; # Wayland clipboard
          xsel.enable = true;      # X11 clipboard
        };
        register = "unnamedplus";  # Use system clipboard
      };
      smartindent = true;
      shiftwidth = 2;
      breakindent = true;
      hlsearch = true;
      incsearch = true;
      wrap = true;
      splitbelow = true;
      splitright = true;
      mouse = "a";                # Enable mouse support
      ignorecase = true;
      smartcase = true;
      updatetime = 250;
      scrolloff = 10;
      swapfile = false;
      backup = false;
      undofile = true;            # Persistent undo
      list = true;
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";
      inccommand = "split";
      cursorline = true;
      completeopt = [ "menuone" "noselect" "noinsert" ];
      foldcolumn = "0";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
    };

    # Enable multiple themes for toggling (no Nord)
    colorschemes = {
      gruvbox.enable = true;
      solarized.enable = true;
      tokyonight.enable = true;
      catppuccin.enable = true;
    };

    # Plugin configurations
    plugins = {
      # Enable web-devicons for better UI
      web-devicons.enable = true;

      # LSP configuration
      lsp = {
        enable = true;
        servers = {
          rust_analyzer = { enable = true; }; # Rust LSP
          nil_ls = { enable = true; };        # Nix LSP
          ts_ls = { enable = true; };         # TypeScript, JavaScript, React
          cssls = { enable = true; };         # CSS
          html = { enable = true; };          # HTML
          clangd = { enable = true; };        # C/C++
          sqls = { enable = true; };          # SQL (for PostgreSQL)
        };
        keymaps = {
          silent = true;
          lspBuf = {
            "gd" = { action = "definition"; desc = "Goto Definition"; };
            "gr" = { action = "references"; desc = "Goto References"; };
            "gD" = { action = "declaration"; desc = "Goto Declaration"; };
            "gI" = { action = "implementation"; desc = "Goto Implementation"; };
            "gT" = { action = "type_definition"; desc = "Type Definition"; };
            "K" = { action = "hover"; desc = "Hover"; };
            "<C-k>" = { action = "signature_help"; desc = "Signature Help"; };
            "<leader>cw" = { action = "workspace_symbol"; desc = "Workspace Symbol"; };
            "<leader>cr" = { action = "rename"; desc = "Rename"; };
            "<leader>ca" = { action = "code_action"; desc = "Code Action"; };
          };
          diagnostic = {
            "<leader>cd" = { action = "open_float"; desc = "Line Diagnostics"; };
            "[d" = { action = "goto_next"; desc = "Next Diagnostic"; };
            "]d" = { action = "goto_prev"; desc = "Previous Diagnostic"; };
          };
        };
      };

      # Autocompletion with cmp
      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          experimental = { ghost_text = true; };
          performance = {
            debounce = 60;
            fetchingTimeout = 200;
            maxViewEntries = 30;
          };
          snippet = { expand = "luasnip"; };
          formatting = {
            fields = [ "kind" "abbr" "menu" ];
          };
          sources = [
            { name = "nvim_lsp"; }
            { name = "emoji"; }
            {
              name = "buffer";
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
              keywordLength = 3;
            }
            { name = "path"; keywordLength = 3; }
            { name = "luasnip"; keywordLength = 3; }
          ];
          window = {
            completion = {
              border = "rounded";
              winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
            };
            documentation = { border = "rounded"; };
          };
          mapping = {
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-e>" = "cmp.mapping.select_prev_item()";
            "<C-f>" = "cmp.mapping.abort()";
            "<C-v>" = "cmp.mapping.scroll_docs(-4)";
            "<C-t>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          };
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp_luasnip.enable = true;
      cmp-emoji.enable = true;

      # Formatting with conform-nvim
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = { lspFallback = true; timeoutMs = 500; };
          notify_on_error = true;
          formatters_by_ft = {
            html = [ [ "prettierd" "prettier" ] ];
            css = [ [ "prettierd" "prettier" ] ];
            javascript = [ [ "prettierd" "prettier" ] ];
            javascriptreact = [ [ "prettierd" "prettier" ] ];
            typescript = [ [ "prettierd" "prettier" ] ];
            typescriptreact = [ [ "prettierd" "prettier" ] ];
            rust = [ "rustfmt" ];
            nix = [ "nixfmt" ];
            cpp = [ "clang-format" ];
            c = [ "clang-format" ];
            sql = [ "sqlfmt" ];
          };
        };
      };

      # Linting
      lint = {
        enable = true;
        lintersByFt = {
          nix = [ "nix" ];
          javascript = [ "eslint" ];
          typescript = [ "eslint" ];
          cpp = [ "cpplint" ];
        };
        autoCmd = {
          callback.__raw = ''
            function()
              require('lint').try_lint()
            end
          '';
          group = "lint";
          event = [ "BufEnter" "BufWritePost" "InsertLeave" ];
        };
      };

      # File explorer with neo-tree
      neo-tree = {
        enable = true;
        filesystem = {
          window.mappings = {
            "a" = "add";           # Create file/dir
            "r" = "rename";        # Rename file/dir
          };
        };
      };

      # Telescope for file finding and theme switching
      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
          ui-select.enable = true;
        };
      };

      # Syntax highlighting with treesitter
      treesitter = {
        enable = true;
        settings.ensure_installed = [
          "rust" "nix" "javascript" "typescript" "tsx" "css" "html" "cpp" "c" "sql"
        ];
      };

      # Additional plugins for enhanced experience
      bufferline.enable = true;     # Buffer tabs
      lualine.enable = true;        # Statusline
      luasnip.enable = true;        # Snippet engine
      undotree.enable = true;       # Undo history
      gitsigns.enable = true;       # Git signs
    };

    # Keymappings
    keymaps = [
      # Format code
      {
        mode = [ "n" "v" ];
        key = "<leader>cf";
        action = "<cmd>lua vim.lsp.buf.format()<cr>";
        options = { silent = true; desc = "Format"; };
      }
      # Clear search highlights
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
        options = { silent = true; };
      }
      # Toggle file explorer (NVChad-like Ctrl n)
      {
        mode = "n";
        key = "<C-n>";
        action = "<cmd>Neotree toggle<cr>";
        options = { desc = "Toggle NeoTree"; };
      }
      # Find files with Telescope
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        options = { desc = "Find Files"; };
      }
      # Switch themes with Telescope
      {
        mode = "n";
        key = "<leader>th";
        action = "<cmd>Telescope colorscheme<cr>";
        options = { desc = "Switch Theme"; };
      }
      # Additional NVChad-inspired keymaps
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree reveal<cr>";
        options = { desc = "Show Files"; };
      }
      {
        mode = "n";
        key = "<C-h>";
        action = "<cmd>Neotree focus<cr>";
        options = { desc = "Focus NeoTree"; };
      }
    ];

    # Extra Lua configuration for UI enhancements
    extraConfigLua = ''
      local _border = "rounded"
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, { border = _border }
      )
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, { border = _border }
      )
      vim.diagnostic.config{ float={border=_border} }
      require('lspconfig.ui.windows').default_options = { border = _border }

      -- CMP kind icons
      local cmp = require'cmp'
      cmp.setup {
        formatting = {
          format = function(entry, vim_item)
            local kind_icons = {
              Text = "󰊄", Method = "", Function = "󰡱", Constructor = "",
              Field = "", Variable = "󱀍", Class = "", Interface = "",
              Module = "󰕳", Property = "", Unit = "", Value = "",
              Enum = "", Keyword = "", Snippet = "", Color = "",
              File = "", Reference = "", Folder = "", EnumMember = "",
              Constant = "", Struct = "", Event = "", Operator = "",
              TypeParameter = ""
            }
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            return vim_item
          end
        }
      }
    '';
  };
}