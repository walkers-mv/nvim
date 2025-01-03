-- init.lua:

-- 1. Load core settings
require('config.settings')

-- 2. Load keymaps
require('config.keymaps')

-- 3. Load plugins
require('config.plugins')

-- init.lua
require('config.lsp')

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
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "%.git/",    -- Ignore .git directory
      "%.node_modules/", -- Ignore node_modules directory
      "%.jpg",     -- Ignore .jpg files
      "%.png",     -- Ignore .png files
      "%.exe",     -- Ignore .exe files
      "%.class",   -- Ignore .class files
      "%.pyc",
      "%.zip",
      "%.bin",
      "%.sqlite3",
      "%.db",
      "%.safetensors",
      "%.pth"
    },
  },
}
require('nvim-tree').setup {
  view = {
    width = 30,
    side = 'left',
  },
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_open = "▾",
          arrow_closed = "▸",
        },
      },
    },
  },
  filters = {
    dotfiles = true, -- Hide dotfiles by default
  },
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Add your custom mappings
    vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Go Up'))
  end,
}

