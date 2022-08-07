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

    -- Colorscheme
    use {
        'rebelot/kanagawa.nvim',
        config = function() require'plugins/configs/colorscheme' end
    }

    -- Statusline component
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require'plugins/configs/lualine' end
    }

    -- Tabline component
    use {
        'nanozuki/tabby.nvim',
        config = function() require'plugins/configs/tabby' end
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

            -- CMP source for file paths
            'hrsh7th/cmp-path',

            -- CMP icons
            'onsails/lspkind.nvim',

            -- LSP sources for the completition
            'hrsh7th/cmp-nvim-lsp',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

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

    -- Git signs
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require'plugins/configs/git-signs' end
    }

    -- Git blame commit
    use {
        'f-person/git-blame.nvim',
        config = function() require'plugins/configs/git-blame' end
    }

    -- LazyGit support inside neovim
    use {
        'kdheepak/lazygit.nvim',
        config = function() require'plugins/configs/lazygit' end
    }

    -- Todos comment viewer
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function() require'plugins/configs/todo-comments' end
    }
end)
