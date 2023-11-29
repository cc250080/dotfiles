-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Install Packer ! Remember to follow: packer.nvim instructions

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

-- telescope.nvim this is a fuzzy finder

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
}

-- devicons to use with nerd fonts

  use 'nvim-tree/nvim-web-devicons'

-- Catpuccin Colorscheme

  use { "catppuccin/nvim", as = "catppuccin" }  

-- Treesitter for code parsing and colorization

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})


end)

