return {
  'navarasu/onedark.nvim',
  opts = {
    style = 'darker'
  },
  config = function(_, opts)
    require('onedark').setup(opts)
    require('onedark').load()
  end,
}
