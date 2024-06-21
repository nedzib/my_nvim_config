-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim' },
    config = function()
      require('telescope')
    end
  }

  use({
      'luisiacc/gruvbox-baby',
      as = 'gruvbox-baby',
      config = function()
          vim.cmd('colorscheme gruvbox-baby')
      end
  })

  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }


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
          {"hrsh7th/cmp-emoji"},
          {"chrisgrieser/cmp-nerdfont"},
          {'hrsh7th/cmp-calc'},
          {'hrsh7th/cmp-cmdline'},
          {"roobert/tailwindcss-colorizer-cmp.nvim"},
          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
      }
  }

  use('jiangmiao/auto-pairs')
  use('tpope/vim-endwise')
  use('tpope/vim-rails')
  use('tpope/vim-surround')
  use('tpope/vim-commentary')
  use('luochen1990/rainbow')
  use('APZelos/blamer.nvim')
  use('godlygeek/csapprox')
  use('nvim-tree/nvim-web-devicons')
  use('ingydotnet/yaml-vim')
  use('tpope/vim-fugitive')
  use("mhinz/vim-signify")
  use('Yggdroot/indentLine')
  use('nvim-lualine/lualine.nvim')
  use('nvim-tree/nvim-tree.lua')
  use('sindrets/diffview.nvim')
  use('onsails/lspkind.nvim')
  use('ericpruitt/tmux.vim')
  use('tomasky/bookmarks.nvim')

  use {
      'linrongbin16/lsp-progress.nvim',
      config = function()
          require('lsp-progress').setup()
      end
  }

  use {
      'VonHeikemen/fine-cmdline.nvim',
      requires = {
          {'MunifTanjim/nui.nvim'}
      }
  }

  use {
      'goolord/alpha-nvim',
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = function ()
          require'alpha'.setup(require'alpha.themes.startify'.config)
      end
  }

  use({
      "stevearc/aerial.nvim",
      config = function()
          require("aerial").setup()
      end,
  })

  -- Remove the `use` here if you're using folke/lazy.nvim.
  use {
      'Exafunction/codeium.vim',
      config = function ()
          -- Change '<C-g>' here to any keycode you like.
          vim.keymap.set('i', '<Tab>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
          vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
          vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
          vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
      end
  }

  end)

