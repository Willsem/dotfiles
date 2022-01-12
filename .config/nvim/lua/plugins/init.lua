local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use {
        'luisiacc/gruvbox-baby',
        config = function() require('plugins/colorscheme') end
    }

    use {
        'neovim/nvim-lspconfig',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'ray-x/lsp_signature.nvim',
            'fatih/vim-go',
        },
        config = function() require('plugins/lspconfig') end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('plugins/treesitter') end
    }

    use {
        'famiu/feline.nvim',
        config = function() require('plugins/feline') end
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('gitsigns').setup() end
    }

    use {
        'f-person/git-blame.nvim',
        config = function() require('plugins/git-blame') end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins/nvim-tree') end
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('plugins/indent-blankline') end
    }

    use {
        'NTBBloodbath/rest.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('plugins/rest-nvim') end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('plugins/telescope') end
    }

    use 'editorconfig/editorconfig-vim'

    use 'cespare/vim-toml'
end)
