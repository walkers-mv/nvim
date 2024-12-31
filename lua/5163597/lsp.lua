local lspconfig = require("lspconfig")

-- Pyright setup
lspconfig.pyright.setup({
  -- settings = { ... } -- Optional Pyright-specific settings
})

-- tsserver setup
lspconfig.tsserver.setup({
  -- settings = { ... } -- Optional TypeScript/JavaScript settings
})

