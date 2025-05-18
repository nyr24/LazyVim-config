-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local language_info = {
	{
		file_type = "*",
		auto_format = false,
		indent = 2,
	},
	{
		file_type = "html",
		auto_format = false,
		indent = 2,
	},
	{
		file_type = "css",
		auto_format = false,
		indent = 2,
	},
	{
		file_type = "scss",
		auto_format = false,
		indent = 2,
	},
	{
		file_type = "less",
		auto_format = false,
		indent = 2,
	},
	{
		file_type = "javascript",
		auto_format = false,
		indent = 2,
	},
	{
		file_type = "javascriptreact",
		auto_format = false,
		indent = 2,
	},
	{
		file_type = "typescript",
		auto_format = false,
		indent = 2,
	},
	{
		file_type = "typescriptreact",
		auto_format = false,
		indent = 2,
	},
	-- serious languages
	{
		file_type = "c",
		auto_format = false,
		indent = 4,
	},
	{
		file_type = "cpp",
		auto_format = false,
		indent = 4,
	},
	{
		file_type = "rust",
		auto_format = false,
		indent = 4,
	},
	{
		file_type = "zig",
		auto_format = true,
		indent = 4,
	},
	{
		file_type = "odin",
		auto_format = true,
		indent = 4,
	},
}

-- Autoformat setting
local set_lang_options = function(pattern, auto_format, indent_size)
	vim.api.nvim_create_autocmd({ "FileType" }, {
		pattern = pattern,
		callback = function()
			vim.b.autoformat = auto_format
			vim.opt.tabstop = indent_size
			vim.opt.shiftwidth = indent_size
			vim.opt.softtabstop = indent_size
		end,
	})
end

for i = 1, #language_info do
	local lang = language_info[i]
	set_lang_options({ lang.file_type }, lang.auto_format, lang.indent)
end
