local lspconfig = require("lspconfig")

-- Pyright setup
lspconfig.pyright.setup({
  -- settings = { ... } -- Optional Pyright-specific settings
})

-- tsserver setup
require('lspconfig').ts_ls.setup{}


