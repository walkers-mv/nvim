-- init.lua:

-- 1. Load core settings
require('5163597.settings')

-- 2. Load keymaps
require('5163597.keymaps')

-- 3. Load plugins
require('5163597.plugins')

-- init.lua
require('5163597.lsp')

-- Reload Neovim whenever you save plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

vim.cmd.colorscheme('tokyonight')

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,  -- Enable Treesitter-based highlighting
    },
    textobjects = {
        select = {
            enable = true,  -- Enable text object selection
            lookahead = true,  -- Automatically jump forward to text objects
            keymaps = {
                -- Define text objects for Python blocks
                ["af"] = "@function.outer",  -- Around function
                ["if"] = "@function.inner",  -- Inside function
                ["ac"] = "@class.outer",     -- Around class
                ["ic"] = "@class.inner",     -- Inside class
            },
        },
    },
}

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- Add Ruff as a diagnostic (linter)
        null_ls.builtins.diagnostics.ruff,
        -- Optionally, add Ruff as a formatter
        null_ls.builtins.formatting.ruff,
    },
})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
require('nvim-autopairs').setup({
    -- Add any custom configuration here, or leave empty for defaults
})

