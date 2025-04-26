local default_opts = { noremap = true, silent = true }
local set_opts_descr = function (desc)
    local opts = {};
    opts.noremap = true;
    opts.silent = true;
    opts.desc = desc;
    return opts;
end

-- Indentation
vim.keymap.set("v", "<", "<gv", default_opts)
vim.keymap.set("v", ">", ">gv", default_opts)
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", default_opts)
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", default_opts)
vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga peek_definition<CR>", set_opts_descr("Peek definition"))
vim.keymap.set("n", "<leader>pi2", "<cmd>set shiftwidth=2<CR>", set_opts_descr("Indent size=2"));
vim.keymap.set("n", "<leader>pi4", "<cmd>set shiftwidth=4<CR>", set_opts_descr("Indent size=4"));

if vim.env.TMUX ~= nil then
  vim.api.nvim_set_keymap("n", "<leader>gc", "gcc", set_opts_descr("Comment line"))
  vim.api.nvim_set_keymap("v", "<leader>gc", "gcc", set_opts_descr("Comment line"))
else
  vim.api.nvim_set_keymap("n", "<leader>gc", "gcc", set_opts_descr("Comment line"))
  vim.api.nvim_set_keymap("v", "<leader>gc", "gcc", set_opts_descr("Comment line"))
end

