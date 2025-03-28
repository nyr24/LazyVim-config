local default_opts = { noremap = true, silent = true }

-- Indentation
vim.keymap.set("v", "<", "<gv", default_opts)
vim.keymap.set("v", ">", ">gv", default_opts)
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", default_opts)
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", default_opts)

if vim.env.TMUX ~= nil then
  vim.api.nvim_set_keymap("n", "<leader>gc", "gcc", { noremap = false })
  vim.api.nvim_set_keymap("v", "<leader>gc", "gcc", { noremap = false })
else
  vim.api.nvim_set_keymap("n", "<leader>gc", "gcc", { noremap = false })
  vim.api.nvim_set_keymap("v", "<leader>gc", "gcc", { noremap = false })
end

