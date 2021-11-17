local M = {}

M.codicon_map = {}
local codicon_csv = vim.env.HOME..'/.config/nvim/lua/codicon.csv'

for line in io.lines(codicon_csv) do
  local short_name, character, _ = line:match("%s*(.-),%s*(.-),%s*(.-)")
  M.codicon_map[short_name] = character
end

M.lsp_kindname_to_codicon_name = {
  Class = "symbol-class",
  Color = "symbol-color",
  Constant = "symbol-constant",
  Constructor = "symbol-method",
  Enum = "symbol-enum",
  EnumMember = "symbol-enum-member",
  Event = "symbol-event",
  Field = "symbol-field",
  File = "symbol-file",
  Folder = "folder",
  Function = "symbol-method",
  Interface = "symbol-interface",
  Keyword = "symbol-keyword",
  Method = "symbol-method",
  Module = "symbol-namespace",
  Operator = "symbol-operator",
  Property = "symbol-property",
  Reference = "references",
  Struct = "symbol-structure",
  Snippet = "symbol-snippet",
  Text = "symbol-key",
  TypeParameter = "symbol-parameter",
  Unit = "symbol-ruler",
  Value = "symbol-enum",
  Variable = "symbol-variable",
}

M.convert_lsp_kindname_to_codicon = function (kind, unknown_icon)
  local codicon_name = M.lsp_kindname_to_codicon_name[kind]
  if codicon_name == nil then
    return unknown_icon
  else
    return M.codicon_map[codicon_name]
  end
end

return M
