return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "windwp/nvim-ts-autotag" },
	opts = {
		ensure_installed = {
			"phpdoc",
			"html",
			"php",
			"javascript",
			"typescript",
			"dockerfile",
			"markdown",
			"tsx",
			"astro",
			"scss",
			"css",
			"lua",
			"dockerfile",
			"yaml",
			"graphql",
		},

		highlight = {
			enable = true,
			use_languagetree = true,
		},

		indent = { enable = true },
		autotag = {
			enable = true,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
