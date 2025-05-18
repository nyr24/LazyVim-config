local typescript_organise_imports = require("util.lsp").typescript_organise_imports
local lspconfig = require("lspconfig")
local capabilities = require("blink-cmp").get_lsp_capabilities()
local on_attach = require("util.lsp").on_attach

return {
	"neovim/nvim-lspconfig",
	opts = {
		capabilities = capabilities,
		on_attach = on_attach,
		servers = {
			-- lua
			lua_ls = {
				settings = {
					Lua = {
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
			},

			-- json
			jsonls = {
				filetypes = { "json", "jsonc" },
			},

			-- python
			pyright = {
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
			},

			-- typescript
			ts_ls = {
				filetypes = {
					"typescript",
					"javascript",
					"typescriptreact",
					"javascriptreact",
				},
				commands = {
					TypeScriptOrganizeImports = typescript_organise_imports,
				},
			},

			-- bash
			bashls = {
				filetypes = { "sh", "aliasrc" },
			},

			-- typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
			emmet_ls = {
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
			},

			-- css
			cssls = {},
			css_variables = {},
			somesass_ls = {},

			-- html
			html = {},

			-- docker
			dockerls = {},

			-- C/C++
			clangd = {
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
			},

			-- cmake
			cmake = {},

			-- assembly
			asm_lsp = {
				cmd = { "asm-lsp" },
				filetypes = {
					"asm",
					"vmasm",
				},
			},

			-- rust
			rust_analyzer = {
				filetypes = { "rust" },
				root_dir = lspconfig.util.root_pattern("Cargo.toml"),
				settings = {
					["rust-analyzer"] = {
						imports = {
							granularity = {
								group = "module",
							},
							prefix = "self",
						},
						cargo = {
							runBuildScript = true,
							allFeatures = true,
						},
						procMacro = {
							enable = true,
						},
					},
				},
			},

			-- zig
			zls = {},

			-- odin
			ols = {},
		},
	},
}
