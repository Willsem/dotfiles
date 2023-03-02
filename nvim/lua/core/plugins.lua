return {
  -- Plugin manager
  { "wbthomason/packer.nvim" },

  -- Cache optimizer
  {
    "lewis6991/impatient.nvim",
    config = function()
      require("configs.impatient")
    end,
  },

  -- Colorscheme
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("configs.colorscheme")
    end,
  },

  -- Notifications
  {
    "rcarriga/nvim-notify",
    config = function()
      require("configs.notify")
    end,
  },

  -- LSP installer
  {
    "williamboman/mason.nvim",
    config = function()
      require("configs.mason")
    end,
  },

  -- LSP
  { "neovim/nvim-lspconfig" },

  -- LSP completion
  {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("configs.cmp")
    end,
  },

  -- Bridge between mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("configs.mason-lspconfig")
    end,
  },

  -- TreeSitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
    config = function()
      require("configs.treesitter")
    end,
  },

  -- Tree explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("configs.neo-tree")
    end,
  },

  -- Mappings tooltip and mapping creation
  {
    "folke/which-key.nvim",
    config = function()
      require("configs.which-key")
    end,
  },

  -- Git tool
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("configs.gitsigns")
    end,
  },

  -- Statusline
  {
    "rebelot/heirline.nvim",
    config = function()
      require("configs.heirline")
    end,
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("configs.bufferline")
    end,
  },

  -- Buffer closing
  { "famiu/bufdelete.nvim" },

  -- Splits moving and resizing
  { "mrjones2014/smart-splits.nvim" },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("configs.telescope")
    end,
  },

  -- Escape mappings
  {
    "max397574/better-escape.nvim",
    config = function()
      require("configs.better-escape")
    end,
  },

  -- Indentline
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("configs.indent-blankline")
    end,
  },
}
