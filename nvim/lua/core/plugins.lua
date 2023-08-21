return {
    {
        -- Cache optimizer
        "lewis6991/impatient.nvim",
        config = function() require("configs.impatient") end
    }, {
        -- Colorscheme
        "catppuccin/nvim",
        name = "catppuccin",
        config = function() require("configs.colorscheme") end,
        priority = 1000
    }, {
        -- Startup screen
        "goolord/alpha-nvim",
        config = function() require("configs.alpha") end
    }, {
        -- Notifications
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"},
        config = function() require("configs.noice") end
    }, {
        -- LSP installer
        "williamboman/mason.nvim",
        config = function() require("configs.mason") end
    }, {
        -- LSP
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim", "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic"
        },
        config = function() require("configs.mason-lspconfig") end
    }, {
        -- Formating and linting
        "jay-babu/mason-null-ls.nvim",
        event = {"BufReadPre", "BufNewFile"},
        dependencies = {
            "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim"
        },
        config = function() require("configs.mason-null-ls") end
    }, {
        -- LSP completion
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline", "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim"
        },
        config = function() require("configs.cmp") end
    }, {
        -- TreeSitter
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "windwp/nvim-ts-autotag", "nvim-treesitter/nvim-treesitter-refactor"
        },
        config = function() require("configs.treesitter") end
    }, {
        -- Tree explorer
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
        config = function() require("configs.neo-tree") end
    }, {
        -- Mappings tooltip and mapping creation
        "folke/which-key.nvim",
        config = function() require("configs.which-key") end
    }, {
        -- Git tool
        "lewis6991/gitsigns.nvim",
        config = function() require("configs.gitsigns") end
    }, {
        -- Statusline
        "rebelot/heirline.nvim",
        dependencies = {
            {
                "linrongbin16/lsp-progress.nvim",
                branch = "main",
                event = {"VimEnter"},
                dependencies = {"nvim-tree/nvim-web-devicons"},
                config = function()
                    require("configs.lsp-progress")
                end
            }
        },
        config = function() require("configs.heirline") end
    }, {
        "utilyre/barbecue.nvim",
        version = "*",
        dependencies = {"SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons"},
        config = function() require("configs.barbecue") end
    }, {
        -- Bfferline
        "akinsho/bufferline.nvim",
        version = "3.*",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function() require("configs.bufferline") end
    }, "famiu/bufdelete.nvim", -- Buffer closing
    "mrjones2014/smart-splits.nvim", -- Splits moving and resizing
    {
        -- Fuzzy finder
        "nvim-telescope/telescope.nvim",
        version = "0.1.*",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function() require("configs.telescope") end
    }, {
        -- Indentline
        "lukas-reineke/indent-blankline.nvim",
        config = function() require("configs.indent-blankline") end
    }, {
        -- Commenting by a mapping
        "numToStr/Comment.nvim",
        config = function() require("configs.Comment") end
    }, "gpanders/editorconfig.nvim"
}
