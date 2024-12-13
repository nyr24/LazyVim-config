return {
  {
    "catppuccin/nvim",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = "mocha",
      term_colors = true,
      default_integrations = true,
      transparent_background = true,
    },
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = "moon",
  --     transparent = true,
  --   },
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
