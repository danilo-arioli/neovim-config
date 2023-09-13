return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    ensure_installed = { "php", "javascript", "typescript", "dockerfile", "markdown", "tsx", "astro", "scss",
      "css", "lua" },

    highlight = {
      enable = true,
      use_languagetree = true,
    },

    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
