return {
	"navarasu/onedark.nvim",
	opts = {
		style = "darker",
	},
	priority = 1000,
	init = function(_, opts)
		require("onedark").setup(opts)
		require("onedark").load()
vim.cmd.colorscheme "onedark"
	end,
}
