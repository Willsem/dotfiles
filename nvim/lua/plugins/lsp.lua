return {
    {
        'neovim/nvim-lspconfig',
    },
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                lua = { 'stylua' },
                go = { 'golangci-lint', 'goimports', 'gofmt' },
                typst = { 'prettypst' },
                json = { 'jq' },
                http = { 'kulala-fmt' },
                markdown = { 'prettier' },
                sh = { 'beautysh' },
                sql = { 'sleek' },
            },
        },
    },
    {
        'saghen/blink.cmp',
        version = 'v1.*',
    },
    {
        'mason-org/mason.nvim',
        opts = {
            ensure_installed = {
                'prettier',
                'gofumpt',
                'goimports',
                'jq',
                'kulala-fmt',
                'prettypst',
                'stylua',
                'sleek',
            },
        },
    },
}
