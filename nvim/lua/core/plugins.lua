return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('configs.colorscheme')
    end,
  },

  {
    'yamatsum/nvim-nonicons',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require('configs.nonicons')
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
    },
    config = function()
      require('configs.treesitter')
    end,
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      '3rd/image.nvim',
    },
    config = function()
      require('configs.neo-tree')
    end,
  },

  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('configs.bufferline')
    end,
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('configs.which-key')
    end,
  },

  {
    'rebelot/heirline.nvim',
    event = 'UiEnter',
    config = function()
      require('configs.heirline')
    end,
  },

  'mrjones2014/smart-splits.nvim', -- Splits moving and resizing
  'famiu/bufdelete.nvim',

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('configs.gitsigns')
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('configs.telescope')
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('configs.indent-blackline')
    end,
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('configs.comment')
    end,
  },

  {
    'goolord/alpha-nvim',
    config = function()
      require('configs.alpha')
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      {
        'williamboman/mason.nvim',
        config = function()
          require('configs.mason')
        end,
      },
      'neovim/nvim-lspconfig',
      'SmiteshP/nvim-navic',
    },
    config = function()
      require('configs.mason-lspconfig')
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind.nvim',
    },
    config = function()
      require('configs.cmp')
    end,
  },

  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      {
        'nvimtools/none-ls.nvim',
        config = function()
          require('configs.null-ls')
        end,
      },
    },
    config = function()
      require('configs.mason-null-ls')
    end,
  },

  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('configs.barbecue')
    end,
  },

  {
    'codota/tabnine-nvim',
    build = './dl_binaries.sh',
    config = function()
      require('configs.tabnine')
    end,
  },
}
