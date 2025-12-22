vim.lsp.enable({ 'lua_ls', 'gopls', 'tinymist' })

vim.lsp.config.gopls = {
    settings = {
        gopls = {
            buildFlags = { '-tags=e2e' },
        },
    },
}

require('blink.cmp').setup({
    fuzzy = {
        implementation = 'rust',
    },
    completion = {
        documentation = {
            auto_show = true,
        },
        accept = {
            auto_brackets = {
                enabled = true,
            },
        },
        list = {
            selection = {
                preselect = false,
                auto_insert = true,
            },
        },
    },
    signature = {
        enabled = true,
    },
    keymap = {
        preset = 'default',
        ['<Tab>'] = { 'select_next', 'fallback_to_mappings' },
        ['<S-Tab>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-p>'] = { 'scroll_documentation_up', 'fallback_to_mappings' },
        ['<C-n>'] = { 'scroll_documentation_down', 'fallback_to_mappings' },
        ['<CR>'] = { 'accept', 'fallback' },
    },
})

local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config('*', {
    capabilities = capabilities,
})

vim.diagnostic.config({
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.HINT] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
        },
    },
})

vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function(args)
        require('conform').format({ bufnr = args.buf })
    end,
})
