-- Customization to be merged with default plugin behavior
return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        gopls = {
          settings = {
            gopls = {
              -- Set back to gopls defaults
              -- https://tip.golang.org/gopls/settings#directoryfilters-string
              directoryFilters = { "-**/node_modules" },
              -- https://tip.golang.org/gopls/settings#analyses-mapstringbool
              -- Need to explicitly set these to false. Providing an empty list just
              -- merges nothing with the explicitly configured analyses from the lang.go
              -- extra.
              analyses = {
                nilness = false,
                unusedparams = false,
                unusedwrite = false,
                useany = false,
              },
              -- semanticTokens cause gopls to hog memory in large projects (terraform-provider-aws)
              semanticTokens = false,

              staticcheck = false,
            },
          },
        },
      },
    },
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports" }, -- gofumpt configured by default, remove it
      },
    },
  },

  -- Plugin Keymaps
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    },
  },

  -- Colorscheme
  { "Mofiqul/dracula.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },

  -- Additional non-extras
  { "tpope/vim-vinegar" },

  -- Disabled default plugins
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false }, -- prefer vim-vinegar instead
      indent = { enabled = false },
      words = { enabled = false },
    },
  },
  -- { "folke/noice.nvim", enabled = false },
}
