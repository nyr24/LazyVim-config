return {
	"jay-babu/mason-nvim-dap.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("mason-nvim-dap").setup({
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
				codelldb = function(config)
					config.args = function()
						local out = {}
						local args_str = vim.fn.input("Arguments: ")
						if string.len(args_str) == 0 then
							return out
						end

						out = vim.fn.split(args_str, " ")
					end

					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})
	end,
}
