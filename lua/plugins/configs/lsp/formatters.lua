return {
	"mhartington/formatter.nvim",
	opts = function()
		return {
			filetype = {
				lua = {
					-- "formatter.filetypes.lua" defines default configurations for the
					-- "lua" filetype
					require("formatter.filetypes.lua").stylua,
				},
				php = {
					require("formatter.filetypes.php").php_cs_fixer,
				},
				typescript = {
					require("formatter.filetypes.typescript").prettierd,
				},
				typescriptreact = {
					require("formatter.filetypes.typescriptreact").prettierd,
				},
				javascript = {
					require("formatter.filetypes.javascript").prettier,
				},
				css = {
					require("formatter.filetypes.css").prettierd,
				},
			},
		}
	end,
	config = function(_, opts)
		-- Create an autocmd group called "FormatAutogroup"
		vim.cmd("augroup FormatAutogroup")
		-- Clear any existing autocmds in the group
		vim.cmd("autocmd!")
		-- Define the autocmd for BufWritePost event
		vim.cmd("autocmd BufWritePost * FormatWrite")
		-- End the autocmd group
		vim.cmd("augroup END")
		require("formatter").setup(opts)
	end,
}
