return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function() require('configs.colorscheme') end,
  },

  {
    'yamatsum/nvim-nonicons',
    dependencies = {
      'kyazdani42/nvim-web-devicons'
    },
    config = function() require('configs.nonicons') end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
    },
    config = function() require('configs.treesitter') end,
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
    config = function() require('configs.neo-tree') end,
  },

  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function() require('configs.bufferline') end,
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function() require('configs.which-key') end,
  },

  {
    'rebelot/heirline.nvim',
    event = 'UiEnter',
    config = function() require('configs.heirline') end,
  },

  'mrjones2014/smart-splits.nvim', -- Splits moving and resizing
  'famiu/bufdelete.nvim',

  {
    'lewis6991/gitsigns.nvim',
    config = function() require('configs.gitsigns') end,
  },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function() require('configs.telescope') end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function() require('configs.indent-blackline') end,
  },

  {
    'numToStr/Comment.nvim',
    config = function() require('configs.comment') end,
  },

  {
    'goolord/alpha-nvim',
    config = function() require('configs.alpha') end,
  },
}
