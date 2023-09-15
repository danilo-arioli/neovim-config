return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
		},
	},
	config = function()
		-- Here is where you configure the autocompletion settings.
		local lsp_zero = require("lsp-zero")
		local lsp = require("lsp-zero").preset({})

		-- And you can configure cmp even more, if you want to.
		local cmp = require("cmp")
		local cmp_action = lsp_zero.cmp_action()
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			sources = {
				-- ordered by priority
				{ name = "luasnip" },
				{ name = "nvim_lsp", keyword_length = 1 },
				{ name = "path" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
			},
			experimental = { ghost_text = true },

			formatting = lsp_zero.cmp_format(),
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.confirm(),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-f>"] = cmp_action.luasnip_jump_forward(),
				["<C-b>"] = cmp_action.luasnip_jump_backward(),
				["<Enter>"] = cmp.mapping.confirm({ select = true }),
			}),
		})
	end,
}
