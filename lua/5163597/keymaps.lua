-- keymaps.lua

-- Local shorthand for setting keymaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Example: Press <Leader>e to open file explorer
keymap('n', '<leader>e', ':Ex<CR>', opts)

-- Example: Remap splitting windows
keymap('n', '<leader>sv', ':vsplit<CR>', opts)
keymap('n', '<leader>sh', ':split<CR>', opts)

-- Example: Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)

-- Visual mode mappings for Treesitter text objects
vim.api.nvim_set_keymap('v', 'ac', '<cmd>lua require"nvim-treesitter.textobjects.select".select("@class.outer")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'ic', '<cmd>lua require"nvim-treesitter.textobjects.select".select("@class.inner")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'af', '<cmd>lua require"nvim-treesitter.textobjects.select".select("@function.outer")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'if', '<cmd>lua require"nvim-treesitter.textobjects.select".select("@function.inner")<CR>', { noremap = true, silent = true })

