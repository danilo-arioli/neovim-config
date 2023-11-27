return {
 "folke/trouble.nvim",
 dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
		vim.keymap.set("n", "<leader>ses", function() require("trouble").toggle("workspace_diagnostics") end)
  end,
 opts = {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
 },
}
