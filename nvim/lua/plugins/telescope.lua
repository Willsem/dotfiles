return {
    {
        'nvim-telescope/telescope.nvim',
        tag = 'v0.2.0',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            'nvim-telescope/telescope-fzf-native.nvim',
            'ya2s/nvim-nonicons',
        },

        opts = {
            defaults = {
                prompt_prefix = ' ' .. require('nvim-nonicons').get('telescope') .. '  ',
                selection_caret = ' ❯ ',
                entry_prefix = '   ',
                layout_config = {
                    horizontal = {
                        preview_width = 0.4,
                    },
                    width = 0.9,
                    height = 0.9,
                },
            },
        },
    },
}
