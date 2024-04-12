-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
      'luisiacc/gruvbox-baby',
      as = 'gruvbox-baby',
      config = function()
          vim.cmd('colorscheme gruvbox-baby')
      end
  })

  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })

  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,}


      use("nvim-treesitter/playground")
      use('nvim-lua/plenary.nvim')
      use("theprimeagen/harpoon")
      use("mbbill/undotree")
      use("nvim-treesitter/nvim-treesitter-context");

      use {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v1.x',
          requires = {
              -- LSP Support
              {'neovim/nvim-lspconfig'},
              {'williamboman/mason.nvim'},
              {'williamboman/mason-lspconfig.nvim'},

              -- Autocompletion
              {'hrsh7th/nvim-cmp'},
              {'hrsh7th/cmp-buffer'},
              {'hrsh7th/cmp-path'},
              {'saadparwaiz1/cmp_luasnip'},
              {'hrsh7th/cmp-nvim-lsp'},
              {'hrsh7th/cmp-nvim-lua'},

              -- Snippets
              {'L3MON4D3/LuaSnip'},
              {'rafamadriz/friendly-snippets'},
          }
      }

      use("github/copilot.vim")
      -- Ned cosas
      use('jiangmiao/auto-pairs')
      use('powerline/powerline')
      use('tpope/vim-endwise')
      use('tpope/vim-rails')
      use('voldikss/vim-floaterm')
      use('frazrepo/vim-rainbow')
      use('APZelos/blamer.nvim')
      use('godlygeek/csapprox')
      use('nvim-tree/nvim-web-devicons')
      use('prichrd/netrw.nvim')
      use('ingydotnet/yaml-vim')
      use('tpope/vim-fugitive')
      use("mhinz/vim-signify")
      use('Yggdroot/indentLine')
      use('nvim-lualine/lualine.nvim')

      use {
          'VonHeikemen/fine-cmdline.nvim',
          requires = {
              {'MunifTanjim/nui.nvim'}
          }
      }
      use 'romgrk/barbar.nvim'
      use 'sindrets/diffview.nvim'
      --Temas
      use('sainnhe/everforest')
      --
  end)

