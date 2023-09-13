return {
  'RRethy/vim-illuminate',
  opts = {
    under_cursor = true,
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
  end,
}
