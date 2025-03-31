return {
  -- catppuccin
	{
		"catppuccin",
		priority = 1000,
		lazy = false,
		opts = {
			flavour = "mocha",
			term_colors = true,
			default_integrations = true,
			transparent_background = true,
			no_italic = true, -- Force no italic
			no_bold = true, -- Force no bold
		},
	},
  -- nightfly
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000
  },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "nightfly",
		},
	},
}
