-- Map save to ctrl + s
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
-- Move your lines when selected in visual mode
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Keep your cursor at the beginning of the line when alligning lines with J
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })

-- Keep your cursor in position when scrolling through the page
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- use leader-P to preserve previous copy when replacing something
vim.api.nvim_set_keymap("x", "<leader>p", [["_dP]], { noremap = true, silent = true })

-- Open a new vertical split
vim.api.nvim_set_keymap("n", "<leader>ns", ":vsp<CR>", { noremap = true, silent = true })

-- Close the current split
vim.api.nvim_set_keymap("n", "<leader>cs", ":q<CR>", { noremap = true, silent = true })

-- Navigate between splits
vim.api.nvim_set_keymap("n", "<leader>sh", ":wincmd h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sj", ":wincmd j<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sk", ":wincmd k<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sl", ":wincmd l<CR>", { noremap = true, silent = true })

-- Alternate between splits
vim.api.nvim_set_keymap("n", "<leader><Tab>", "<C-w>w", { noremap = true, silent = true })

-- Open a new tab
vim.api.nvim_set_keymap("n", "<leader>nt", ":tabnew<CR>", { noremap = true, silent = true })

-- Close the current tab
vim.api.nvim_set_keymap("n", "<leader>ct", ":tabclose<CR>", { noremap = true, silent = true })

-- Go to the next tab
vim.api.nvim_set_keymap("n", "<Tab>", ":tabnext<CR>", { noremap = true, silent = true })

-- Go to the previous tab
vim.api.nvim_set_keymap("n", "<S-Tab>", ":tabprevious<CR>", { noremap = true, silent = true })

-- Remap the esc key
vim.api.nvim_set_keymap("i", "<A-q>", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-q>", "<Esc>", { noremap = true, silent = true })
