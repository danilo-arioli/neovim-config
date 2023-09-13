return function()
  local lsp_zero = require("lsp-zero")
  -- (Optional) Configure lua language server for neovim
  local lua_opts = lsp_zero.nvim_lua_ls()
  require('lspconfig').lua_ls.setup(lua_opts)
end
