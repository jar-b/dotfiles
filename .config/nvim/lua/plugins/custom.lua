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
              -- Set back to gopls default
              -- https://tip.golang.org/gopls/settings#directoryfilters-string
              directoryFilters = { "-**/node_modules" },
              -- semanticTokens cause gopls to hog memory in large projects (terraform-provider-aws)
              semanticTokens = false,
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
        go = { "goimports" },
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
  -- UI
  {
    "folke/snacks.nvim",
    opts = {
      -- disable word highlighting
      words = {
        enabled = false,
      },
    },
  },
}
