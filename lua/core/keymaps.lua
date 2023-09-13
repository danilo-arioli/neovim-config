-- Map save to ctrl + s
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
-- Move your lines when selected in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Keep your cursor at the beginning of the line when alligning lines with J
vim.keymap.set("n", "J", "mzJ`z")

-- Keep your cursor in position when scrolling through the page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- use leader-P to preserve previous copy when replacing something
vim.keymap.set("x", "<leader>p", [["_dP]])
