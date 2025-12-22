return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'master',
        lazy = false,
        build = ':TSUpdate',

        config = function(_, _)
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'lua', 'go', 'json', 'http', 'typst', 'markdown' },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },
}
