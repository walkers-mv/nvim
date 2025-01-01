-- plugins.lua


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- A few examples:
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'windwp/nvim-autopairs'

  use 'neovim/nvim-lspconfig'
  
  use {
      'nvim-treesitter/nvim-treesitter-textobjects',
      after = 'nvim-treesitter',  -- Load after Treesitter
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" }
  }  
  use 'morhetz/gruvbox'
  use 'dracula/vim'
  use 'folke/tokyonight.nvim'
  use 'catppuccin/nvim'

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path'
    }
  }

  -- More plugins go here...
end)


