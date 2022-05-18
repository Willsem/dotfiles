local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

return require'packer'.startup(function()
    -- Plugin manager
    use 'wbthomason/packer.nvim'

    -- Time tracker
    use 'wakatime/vim-wakatime'

    -- Colorscheme
    use {
        'rebelot/kanagawa.nvim',
        config = function() require'plugins/configs/colorscheme' end
    }

    -- LSP configuration and language supports
    use {
        'neovim/nvim-lspconfig',

        requires = {
            -- Icons for left corner of lsp diagnostigs
            'tami5/lspsaga.nvim',

            -- Golang programming plugin
            'fatih/vim-go',

            -- Showing the process of loading lsp
            'j-hui/fidget.nvim',

            -- Completion
            'hrsh7th/nvim-cmp',

            -- LSP sources for the completition
            'hrsh7th/cmp-nvim-lsp',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- CMP source for file paths
            'hrsh7th/cmp-path',
        },

        config = function() require'plugins/configs/lspconfig' end
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require'plugins/configs/treesitter' end
    }

    -- File explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        config = function() require'plugins/configs/nvim-tree' end,
        tag = 'nightly'
    }

    -- Startup dashboard
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function () require'plugins/configs/alpha' end
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function () require'plugins/configs/telescope' end
    }

    -- Indents
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function () require'plugins/configs/indent' end
    }

    -- Editorconfig supprot plugin
    use 'gpanders/editorconfig.nvim'
end)
