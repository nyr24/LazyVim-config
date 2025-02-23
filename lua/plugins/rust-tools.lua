local on_attach = require("util.lsp").on_attach

return {
	"simrat39/rust-tools.nvim",
	ft = "rust",
	config = function()
		local rt = require("rust-tools")
		local blink_cmp = require("blink-cmp")
		local capabilities = blink_cmp.get_lsp_capabilities()
		rt.setup({
			server = {
				on_attach = on_attach,
				capabilities = capabilities,
			},
		})
	end,
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
	},
}
