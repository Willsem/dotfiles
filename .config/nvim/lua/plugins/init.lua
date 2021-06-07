local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- Design
    use 'folke/tokyonight.nvim'

    use {
        'yamatsum/nvim-nonicons',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins/bufferline') end
    }

    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() require('plugins/galaxyline') end,
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins/nvim-tree') end
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        config = function() require('plugins/lspconfig') end
    }

    use 'nvim-lua/completion-nvim'

    use 'fatih/vim-go'

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('plugins/gitsigns') end
    }

    use 'f-person/git-blame.nvim'

    -- Utils
    use 'yamatsum/nvim-cursorline'

    use 'editorconfig/editorconfig-vim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function() require('plugins/telescope') end
    }
end)

