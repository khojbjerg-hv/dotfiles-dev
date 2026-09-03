return {
  -- 1. Turn off the downloader's auto-install trigger
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = false,
    },
  },
  -- 2. Clear out LazyVim's default background download list
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "tree-sitter-cli",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = { mason = false },
        ruff = { mason = false },
      },
    },
  },
}
