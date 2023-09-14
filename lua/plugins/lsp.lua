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
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			-- This is where all the LSP shenanigans will live
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			local keymap = vim.keymap -- for conciseness

			local opts = { noremap = true, silent = true }

			lsp_zero.on_attach(function(client, bufnr)
				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "<leader>sr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "<leader>sd", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "<leader>sdd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "<leader>si", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "<leader>td", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "?", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			-- autoformat on save
			lsp_zero.preset("recommended")

			lsp_zero.setup()

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"intelephense",
					"tsserver",
					"tailwindcss",
					"eslint",
					"emmet_ls",
					"astro",
					"html",
					"cssls",
					"dockerls",
					"graphql",
          "docker_compose_language_service",
				},
				handlers = {
					lsp_zero.default_setup,
					-- Lua configuration
					lua_ls = function()
						return require("plugins.lsp_configs.lua_ls")
					end,
					-- PHP configuration
					intelephense = function()
						return require("plugins.lsp_configs.intelephense")
					end,

					tsserver = function()
						return require("plugins.lsp_configs.tsserver")
					end,

					emmet_ls = function()
						return require("plugins.lsp_configs.emmet-ls")
					end,

					html = function()
						return require("plugins.lsp_configs.html")
					end,

					cssls = function()
						return require("plugins.lsp_configs.cssls")
					end,

					dockerls = function()
						return require("plugins.lsp_configs.dockerls")
					end,

					astro = function()
						return require("plugins.lsp_configs.astro")
					end,

					tailwindcss = function()
						return require("plugins.lsp_configs.tailwind")
					end,

					graphql = function()
						return require("plugins.lsp_configs.graphql")
					end,

          docker_compose_language_service = function ()
            return require("plugins.lsp_configs.dockercompose_ls")
          end
				},
			})
		end,
	},
}
