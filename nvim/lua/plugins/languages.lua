return {
    {
        'chomosuke/typst-preview.nvim',
        ft = 'typst',
        version = '1.*',

        opts = {
            open_cmd = '/Applications/Zen.app/Contents/MacOS/zen %s -P TypstPreview',
        },
    },

    {
        'toppair/peek.nvim',
        event = { 'VeryLazy' },
        build = 'deno task --quiet build:fast',
        config = function()
            require('peek').setup()
            vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
            vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
        end,
    },
}
