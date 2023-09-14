return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "saadparwaiz1/cmp_luasnip", "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
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
					{ name = "nvim_lua" },
					{ name = "nvim_lsp", keyword_length = 1 },
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
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			-- This is where all the LSP shenanigans will live
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			-- autoformat on save
			lsp_zero.preset("recommended")

			lsp_zero.setup()

			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "intelephense", "tsserver", "tailwindcss", "eslint", "emmet_ls" },
				handlers = {
					lsp_zero.default_setup,
					-- Lua configuration
					lua_ls = function()
						return require("plugins.configs.lsp.configs.lua_ls")
					end,
					-- PHP configuration
					intelephense = function()
						return require("plugins.configs.lsp.configs.intelephense")
					end,

					tsserver = function()
						return require("plugins.configs.lsp.configs.tsserver")
					end,

					emmet_ls = function()
						return require("plugins.configs.lsp.configs.emmet-ls")
					end,

					tailwindcss = function()
						return require("plugins.configs.lsp.configs.tailwind")
					end,
				},
			})
		end,
	},
}
