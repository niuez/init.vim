require 'lsp_ccls'
require 'lsp_lua'
require 'lsp_ts'
require 'lsp_rust_analyzer'

require'lsp_signature'.setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "none"
  },
  hint_enable=false,
})
-- tree sitter for satysfi note: you must move queries(tree-sitter-satysfi/queries/highlight.scm) into (nvim-treesitter/queries/satysfi/)
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.satysfi = {
  install_info = {
    url = "https://github.com/monaqa/tree-sitter-satysfi", -- local path or git repo
    files = {"src/parser.c", "src/scanner.c"},
    revision = "master",
  },
  filetype = "satysfi", -- if filetype does not agrees with parser name
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  }
}


local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local codicon_map = require'codicon'.codicon_map

vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 0,
  folder_arrows = 0,
}
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = '?',
    staged = "✓",
    unmerged = codicon_map['git-compare'],
    renamed = codicon_map['arrow-small-right'],
    untracked = "*",
    deleted = "✗",
    ignored = "-"
  },
  folder = {
    arrow_open = codicon_map['chevron-right'],
    arrow_closed = codicon_map['chevron-down'],
    default = codicon_map['chevron-right'],
    open = codicon_map['chevron-down'],
    empty = codicon_map['chevron-right'],
    empty_open = codicon_map['chevron-down'],
    symlink = codicon_map['file-symlink-directory'],
    symlink_open = codicon_map['file-symlink-directory'],
  }
}


require'nvim-tree'.setup {
  diagnostics = {
    enable = true,
    icons = {
      error = codicon_map['error'],
      warning = codicon_map['warning'],
      info = codicon_map['info'],
      hint = codicon_map['info'],
    }
  },
  view = {
    mappings = {
      custom_only = true,
      list = {
        { key = {"l"},                          cb = tree_cb("edit") },
        { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
        { key = "sv",                           cb = tree_cb("vsplit") },
        { key = "ss",                           cb = tree_cb("split") },
        { key = "<C-t>",                        cb = tree_cb("tabnew") },
        { key = "<",                            cb = tree_cb("prev_sibling") },
        { key = ">",                            cb = tree_cb("next_sibling") },
        { key = "P",                            cb = tree_cb("parent_node") },
        { key = {"<BS>", "h"},                  cb = tree_cb("close_node") },
        { key = "<S-CR>",                       cb = tree_cb("close_node") },
        { key = "<Tab>",                        cb = tree_cb("preview") },
        { key = "K",                            cb = tree_cb("first_sibling") },
        { key = "J",                            cb = tree_cb("last_sibling") },
        { key = "I",                            cb = tree_cb("toggle_ignored") },
        { key = "H",                            cb = tree_cb("toggle_dotfiles") },
        { key = "R",                            cb = tree_cb("refresh") },
        { key = "a",                            cb = tree_cb("create") },
        { key = "d",                            cb = tree_cb("remove") },
        { key = "r",                            cb = tree_cb("rename") },
        { key = "<C-r>",                        cb = tree_cb("full_rename") },
        { key = "x",                            cb = tree_cb("cut") },
        { key = "c",                            cb = tree_cb("copy") },
        { key = "p",                            cb = tree_cb("paste") },
        { key = "y",                            cb = tree_cb("copy_name") },
        { key = "Y",                            cb = tree_cb("copy_path") },
        { key = "gy",                           cb = tree_cb("copy_absolute_path") },
        { key = "[c",                           cb = tree_cb("prev_git_item") },
        { key = "]c",                           cb = tree_cb("next_git_item") },
        { key = "-",                            cb = tree_cb("dir_up") },
        { key = "q",                            cb = tree_cb("close") },
        { key = "g?",                           cb = tree_cb("toggle_help") }
      }
    }
  }
}
require('luasnip.loaders.from_snipmate').lazy_load()
