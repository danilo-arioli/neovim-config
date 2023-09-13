require("lazy").setup({

  {
    'navarasu/onedark.nvim',
    opts = {
      style = 'darker'
    },
    config = function(_, opts)
      require('onedark').setup(opts)
      require('onedark').load()
    end,
  },


  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      'nvim-lua/plenary.nvim', 'danielvolchek/tailiscope.nvim' },
    cmd = "Telescope",
    init = function()
      require("keymaps.telescope")
    end,
    opts = function()
      return require "plugins.configs.telescope"
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },


  {
    'nvim-treesitter/nvim-treesitter',
    opts = function()
      return require "plugins.configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },


  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    init = function()
      require('keymaps.neotree')
    end,
  },


  {
    'RRethy/vim-illuminate',
    opts = {
      under_cursor = true,
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,

  },

  {
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      lazy = true,
      config = false,
      init = function()
        -- Disable automatic setup, we are doing it manually
        vim.g.lsp_zero_extend_cmp = 0
        vim.g.lsp_zero_extend_lspconfig = 0
      end,
    },
    {
      'williamboman/mason.nvim',
      lazy = false,
      config = true,
    },

    -- Autocompletion
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
        { 'L3MON4D3/LuaSnip' },
      },
      config = function()
        -- Here is where you configure the autocompletion settings.
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_cmp()

        -- And you can configure cmp even more, if you want to.
        local cmp = require('cmp')
        local cmp_action = lsp_zero.cmp_action()

        cmp.setup({
          formatting = lsp_zero.cmp_format(),
          mapping = cmp.mapping.preset.insert({
            ['<C-Space>'] = cmp.mapping.confirm(),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
            ['<C-f>'] = cmp_action.luasnip_jump_forward(),
            ['<C-b>'] = cmp_action.luasnip_jump_backward(),
            ['<Tab>'] = cmp.mapping.confirm({ select = true }),
          })
        })
      end
    },

    -- LSP
    {
      'neovim/nvim-lspconfig',
      cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
      event = { 'BufReadPre', 'BufNewFile' },
      dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'williamboman/mason-lspconfig.nvim' },
      },
      config = function()
        -- This is where all the LSP shenanigans will live
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_lspconfig()

        lsp_zero.on_attach(function(client, bufnr)
          -- see :help lsp-zero-keybindings
          -- to learn the available actions
          lsp_zero.default_keymaps({ buffer = bufnr })
        end)
        local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
        local lsp_format_on_save = function(bufnr)
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end

        local lsp = require('lsp-zero')
        lsp.preset('recommended')

        lsp.on_attach(function(client, bufnr)
          lsp_format_on_save(bufnr)
        end)

        lsp.setup()

        require('mason-lspconfig').setup({
          ensure_installed = { "lua_ls", "intelephense" },
          handlers = {
            lsp_zero.default_setup,
            lua_ls = function()
              -- (Optional) Configure lua language server for neovim
              local lua_opts = lsp_zero.nvim_lua_ls()
              require('lspconfig').lua_ls.setup(lua_opts)
            end,

            intelephense = function()
              -- (Optional) Configure lua language server for neovim
              require('lspconfig').intelephense.setup {
                settings = {
                  intelephense = {
                    stubs = {
                      "wordpress",
                      "woocommerce",
                      "acf-pro",
                      "wordpress-globals",
                      "wordpress-seo-stubs",
                      "wp-cli",
                      "genesis",
                      "polylang",
                      "apache",
                      "bcmath",
                      "bz2",
                      "calendar",
                      "com_dotnet",
                      "Core",
                      "ctype",
                      "curl",
                      "date",
                      "dba",
                      "dom",
                      "fileinfo",
                      "filter",
                      "fpm",
                      "ftp",
                      "gd",
                      "hash",
                      "iconv",
                      "imap",
                      "intl",
                      "json",
                      "mssql",
                      "mysqli",
                      "openssl",
                      "PDO",
                      "pdo_ibm",
                      "pdo_mysql",
                      "pdo_pgsql",
                      "pgsql",
                      "Phar",
                      "readline",
                      "recode",
                      "regex",
                      "session",
                      "standard",
                      "superglobals",
                      "sybase",
                      "zip",
                      "zlib"
                    },
                  }
                }
              }
            end,
          }
        })
      end
    }
  }


})
