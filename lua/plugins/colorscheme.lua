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
			no_italic = true, -- Force no italic
			no_bold = true, -- Force no bold
		},
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		style = "moon",
	-- 		transparent = true
	-- 	},
	-- 	styles = {
	-- 		comments = { italic = false },
	-- 		keywords = { italic = false }
	--     }
	-- },
	{
		"LazyVim/LazyVim",
		opts = {
			-- colorscheme = "tokyonight-moon",
			colorscheme = "catppuccin",
		},
	},
}
