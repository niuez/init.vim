
local lspkind = require'lspkind'
lspkind.init({
    preset = 'codicons',
})
-- require'lsp_signature'.setup({
--   bind = true, -- This is mandatory, otherwise border config won't get registered.
--   handler_opts = {
--     border = "none"
--   },
--   hint_enable=false,
-- })
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


vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gf', '<cmd>lua vim.lsp.buf.format {async=true}<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gq', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  end,
})

-- (2) Highlight Reference
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local buffer = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    vim.cmd [[
    " let s:bl = ['json'] " set blacklist filetype
    augroup lsp_document_highlight
      " autocmd! * <buffer>
      " autocmd CursorHold,CursorHoldI <buffer> if index(s:bl, &ft) < 0 | lua vim.lsp.buf.document_highlight()
      " autocmd CursorMoved,CursorMovedI <buffer> if index(s:bl, &ft) < 0 | lua vim.lsp.buf.clear_references()
      autocmd! * <buffer>
      autocmd CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved,CursorMovedI <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]]
  end,
})

my_capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

require'lspconfig'.clangd.setup({
  capabilities = my_capabilities,
})
require'lspconfig'.rust_analyzer.setup({
  capabilities = my_capabilities,
})

local border = "single" -- single, rounded , none, shadow, double, solid
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false,
    border = border
  }
)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    -- :help nvim_open_win() , :help lsp-handlers
    separator = true,
    border = border
    -- width = 100,  -- minimum width みたいなのないかな
    -- :echo winwidth('%') でウィンドウのサイズを取得できる。使えそう
    -- :help winwidth()
  }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, { separator = true }
)


local cmp = require'cmp'
local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  sources = {
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ['<TAB>'] = cmp.mapping.select_next_item(),
    ['<S-TAB>'] = cmp.mapping.select_prev_item(),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = false,
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        -- print(entry.source.name)
        return vim_item
      end
    })
  }
})
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
  }
})
-- cmp.setup.cmdline(":", {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = "path" },
--     { name = "cmdline" },
--   },
-- })
