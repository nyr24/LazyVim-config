local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.icons").diagnostic_signs
local typescript_organise_imports = require("util.lsp").typescript_organise_imports

local config = function()
	require("neoconf").setup({
		diagnostics = {
			signs = false,
		},
	})
	local lspconfig = require("lspconfig")

	-- solidity
	lspconfig.solidity_ls.setup({
		on_attach = on_attach,
		filetypes = { "solidity" },
		root_dir = lspconfig.util.root_pattern("hardhat.config.*", ".git"),
	})

	-- lua
	lspconfig.lua_ls.setup({
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
					},
				},
			},
		},
	})

	-- json
	lspconfig.jsonls.setup({
		on_attach = on_attach,
		filetypes = { "json", "jsonc" },
	})

	-- python
	lspconfig.pyright.setup({
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})

	-- typescript
	lspconfig.ts_ls.setup({
		on_attach = on_attach,
		filetypes = {
			"typescript",
			"javascript",
			"typescriptreact",
			"javascriptreact",
		},
		commands = {
			TypeScriptOrganizeImports = typescript_organise_imports,
		},
		settings = {
			typescript = {
				indentStyle = "tabs",
				indentSize = 4,
			},
		},
	})

	-- bash
	lspconfig.bashls.setup({
		on_attach = on_attach,
		filetypes = { "sh", "aliasrc" },
	})

	-- typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
	lspconfig.emmet_ls.setup({
		on_attach = on_attach,
		filetypes = {
			"typescriptreact",
			"javascriptreact",
			"javascript",
			"css",
			"sass",
			"scss",
			"less",
			"svelte",
			"vue",
			"html",
		},
	})

	-- css
	lspconfig.cssls.setup({
		on_attach = on_attach,
	})

	lspconfig.css_variables.setup({
		on_attach = on_attach,
	})

	lspconfig.somesass_ls.setup({
		on_attach = on_attach,
	})

	-- html
	lspconfig.html.setup({
		on_attach = on_attach,
	})

	-- docker
	lspconfig.dockerls.setup({
		on_attach = on_attach,
	})

	-- C/C++
	lspconfig.clangd.setup({
		on_attach = on_attach,
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
		},
	})

	-- cmake
	lspconfig.cmake.setup({
		on_attach = on_attach,
	})

	-- assembly
	lspconfig.asm_lsp.setup({
		on_attach = on_attach,
		cmd = { "asm-lsp" },
		filetypes = {
			"asm",
			"vmasm",
		},
	})

	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	opts = {},
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
	},
}
