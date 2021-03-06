local omnifunc = require'nvim_omnifunc'
local codicon = require'codicon'

function _G.tsomnifunc(findstart, base)
  return omnifunc.lsp.create_lsp_omnifunc(function(completion_item, ctx)
    local info = completion_item.label
    local word = omnifunc.lsp.get_completion_word(completion_item)
    return {
      word = word,
      kind = word,
      abbr = codicon.convert_lsp_kindname_to_codicon(vim.lsp.util._get_completion_item_kind_name(completion_item.kind), " "),
      menu = info,
      info = info,
      icase = 1,
      dup = 1,
      empty = 1,
      user_data = {
        nvim = {
          lsp = {
            completion_item = completion_item
          }
        }
      },
    }
  end)(findstart, base)
end

local ts_on_attach = function(client, bufnr)
  vim.notify("ccls on attach", vim.log.levels.ERROR, nil)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', "v:lua.tsomnifunc")

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
end

require('lspconfig').tsserver.setup({
  on_attach = ts_on_attach
})
