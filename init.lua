require('options')
require('keymaps')
require('statusline')
require('paren')
require('plugins')

vim.api.nvim_exec([[
colorscheme nightsnow
]], false)

require('nvim-web-devicons').setup {
  color_icons = false;
}
