return {
	"nvimdev/lspsaga.nvim",
	config = function()
		vim.keymap.set("n", "<leader>se", "<cmd>Lspsaga show_line_diagnostics<CR>")
		require("lspsaga").setup({
			lightbulb = {
				enable = false,
				sign = false,
			},
		})
	end,
}
