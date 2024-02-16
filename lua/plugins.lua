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

require("lazy").setup({
  "niuez/SBWW",
  "neovim/nvim-lspconfig",
  "nvim-treesitter/nvim-treesitter",
  "nvim-tree/nvim-web-devicons",
  "nvim-tree/nvim-tree.lua",
  "L3MON4D3/LuaSnip",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "saadparwaiz1/cmp_luasnip",
  "onsails/lspkind.nvim",
  "projekt0n/github-nvim-theme",
  "https://codeberg.org/esensar/nvim-dev-container",
  "kyoh86/momiji",
  'brenoprata10/nvim-highlight-colors',
  'niuez/gekkou.vim',
  'niuez/nightsnow',
  'notomo/lreload.nvim',
  "fynnfluegge/monet.nvim",
  "cideM/yui",
})

require("devcontainer").setup {}

require('lsp_config')
require('cmp_config')
require('tree_config')

require('nvim-highlight-colors').setup {}

-- Enable hot-reloading myplugin
-- require("lreload").enable("lightsnow")
