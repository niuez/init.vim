local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("n", "s", "<Nop>", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sk", "<C-w>k", opts)
keymap("n", "sl", "<C-w>l", opts)
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "sJ", "<C-w>J", opts)
keymap("n", "sK", "<C-w>K", opts)
keymap("n", "sL", "<C-w>L", opts)
keymap("n", "sH", "<C-w>H", opts)
keymap("n", "sn", "gt", opts)
keymap("n", "sp", "gT", opts)
keymap("n", "sr", "<C-w>r", opts)
keymap("n", "s=", "<C-w>=", opts)
keymap("n", "s-", "<C-w>-", opts)
keymap("n", "s+", "<C-w>+", opts)
keymap("n", "s>", "<C-w>>", opts)
keymap("n", "s<", "<C-w><", opts)
keymap("n", "sw", "<C-w>w", opts)
keymap("n", "so", "<C-w>_<C-w>|", opts)
keymap("n", "sO", "<C-w>=", opts)
keymap("n", "sN", ":<C-u>bn<CR>", opts)
keymap("n", "sP", ":<C-u>bp<CR>", opts)
keymap("n", "st", ":<C-u>tabnew<CR>", opts)
keymap("n", "ss", ":<C-u>sp<CR>", opts)
keymap("n", "sv", ":<C-u>vs<CR>", opts)
keymap("n", "sq", ":<C-u>q<CR>", opts)
keymap("n", "ge", ":NvimTreeToggle<CR>", opts)
keymap("t", "<C-q>", "<C-\\><C-n>", term_opts)
-- keymap("n", "sc", ":colorscheme lightsnow<CR>:HighlightColorsOn<CR>", opts)
