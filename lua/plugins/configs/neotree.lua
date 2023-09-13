return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",   -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<C-n>', '<Cmd>Neotree toggle<CR>')
    vim.keymap.set('n', '<C-e>', '<Cmd>Neotree focus<CR>')
  end,
}
