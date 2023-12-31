
# Neovim configuration for PHP, Wordpress and React 


## Prerequisites
* Node and NPM installed
* Ripgrep installed
* A [Nerd Font](https://www.nerdfonts.com/font-downloads) installed
 
## What is included
* Lazy loading for a better and faster development experience
* Diagnostics for typescript, javascript, php, tsx, jsx, docker, astro, html and css
* Autocompletion for all of the above + wordpress snippets
* Smart renaming for the lsp that support it 
* A fuzzy finder and a file tree
* Useful key bindings
* Autoclosing tags, quotes, brackets and whatever else 
* A nice looking ui

## Plugins
* [autopairs](https://github.com/windwp/nvim-autopairs)
* [cmp](https://github.com/hrsh7th/nvim-cmp)
* [comment](https://github.com/windwp/nvim-autopairs)
* [dressing](https://github.com/stevearc/dressing.nvim)
* [formatter](https://github.com/mhartington/formatter.nvim)
* [illuminate](https://github.com/RRethy/vim-illuminate)
* [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
* [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim)
* [lualine](https://github.com/nvim-lualine/lualine.nvim)
* [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
* [startup](https://github.com/startup-nvim/startup.nvim)
* [surround](https://github.com/kylechui/nvim-surround)
* [telescope](https://github.com/nvim-telescope/telescope.nvim)
* [toggleterm](https://github.com/akinsho/toggleterm.nvim)
* [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## How to install
If you are on mac:

```
git clone https://github.com/danilo-arioli/neovim-config ~/.config/nvim 
```

If you are on windows:

```
git clone https://github.com/danilo-arioli/neovim-config %LOCALAPPDATA%\nvim
```
after install you may need to install the formatters:
```
:MasonInstall stylua php-cs-fixer prettierd prettier
```
## How to use
Keeping in mind that the leader key is "space", all the most important key bindings are listed in the initial Neovim screen, just CD into a folder and type:


```
nvim
```
All of the other keybidings can be found in "core.keymaps" or in
the [plugins](#plugins) documentations




