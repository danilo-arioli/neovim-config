return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		under_cursor = true,
		delay = 200,
		large_file_cutoff = 2000,
		large_file_overrides = {
			providers = { "lsp" },
		},
	},
	config = function(_, opts)
		require("illuminate").configure(opts)
		-- vim.cmd("hi IlluminatedWordRead guibg=#484848")
	end,
}
