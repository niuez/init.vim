-- require 'lsp_ccls'
require 'lsp_clangd'
require 'lsp_pyright'
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
-- vim.g.nvim_tree_icons = {
--   default = "",
--   symlink = "",
--   git = {
--     unstaged = '?',
--     staged = "✓",
--     unmerged = codicon_map['git-compare'],
--     renamed = codicon_map['arrow-small-right'],
--     untracked = "*",
--     deleted = "x",
--     ignored = "-"
--   },
--   folder = {
--     arrow_open = codicon_map['chevron-right'],
--     arrow_closed = codicon_map['chevron-down'],
--     default = codicon_map['chevron-right'],
--     open = codicon_map['chevron-down'],
--     empty = codicon_map['chevron-right'],
--     empty_open = codicon_map['chevron-down'],
--     symlink = codicon_map['file-symlink-directory'],
--     symlink_open = codicon_map['file-symlink-directory'],
--   }
-- }
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = '?',
    staged = "✓",
    unmerged = '⇆',
    renamed = '→',
    untracked = "*",
    deleted = "✗",
    ignored = "-"
  },
  folder = {
    arrow_open = '▿',
    arrow_closed = '▻',
    default = '▻',
    open = '▿',
    empty = '▻',
    empty_open = '▿',
    symlink = '►',
    symlink_open = '▾',
  }
}


require'nvim-tree'.setup {
  git = {
    ignore = false,
  },
  diagnostics = {
    enable = true,
    icons = {
      error = '✕',
      warning = '⚡',
      info = '♦',
      hint = '♦',
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


require 'jabs'.setup {
    -- Options for the main window
    position = {'center', 'top'}, -- position = {'<position_x>', '<position_y>'} | <position_x> left, center, right,
                                  --                                             <position_y> top, center, bottom
                                  -- Default {'right', 'bottom'}

    relative = 'editor', -- win, editor, cursor. Default win
    clip_popup_size = false, -- clips the popup size to the win (or editor) size. Default true

    width = 80, -- default 50
    height = 20, -- default 10
    border = 'single', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default shadow

    offset = { -- window position offset
        top = 2, -- default 0
        bottom = 2, -- default 0
        left = 2, -- default 0
        right = 2, -- default 0
    },

    sort_mru = true, -- Sort buffers by most recently used (true or false). Default false
    split_filename = true, -- Split filename into separate components for name and path. Default false
    split_filename_path_width = 20, -- If split_filename is true, how wide the column for the path is supposed to be, Default 0 (don't show path)

    -- Options for preview window
    preview_position = 'left', -- top, bottom, left, right. Default top
    preview = {
        width = 40, -- default 70
        height = 60, -- default 30
        border = 'single', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default double
    },

    -- Default highlights (must be a valid :highlight)
    highlight = {
        current = "Title", -- default StatusLine
        hidden = "StatusLineNC", -- default ModeMsg
        split = "WarningMsg", -- default StatusLine
        alternate = "StatusLine" -- default WarningMsg
    },

    -- Default symbols
    symbols = {
        current = "C", -- default 
        split = "S", -- default 
        alternate = "A", -- default 
        hidden = "H", -- default ﬘
        locked = "L", -- default 
        ro = "R", -- default 
        edited = "E", -- default 
        terminal = "T", -- default 
        default_file = "D", -- Filetype icon if not present in nvim-web-devicons. Default 
        terminal_symbol = ">_" -- Filetype icon for a terminal split. Default 
    },

    -- Keymaps
    keymap = {
        close = "d", -- Close buffer. Default D
        jump = "l", -- Jump to buffer. Default <cr>
        h_split = "s", -- Horizontally split buffer. Default s
        v_split = "v", -- Vertically split buffer. Default v
        preview = "p", -- Open buffer preview. Default P
    },

    -- Whether to use nvim-web-devicons next to filenames
    use_devicons = false -- true or false. Default true
}
