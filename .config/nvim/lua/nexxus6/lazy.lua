-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("nexxus6.plugins")





-- telescope.nvim this is a fuzzy finder
--{
--   'nvim-telescope/telescope.nvim', tag = '0.1.5',
--     dependencies = { 'nvim-lua/plenary.nvim' }
--  }

-- devicons to use with nerd fonts

--'nvim-tree/nvim-web-devicons',

-- Catpuccin Colorscheme

--{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

-- Treesitter for code parsing and colorization

--require("lazy").setup({{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}}),


