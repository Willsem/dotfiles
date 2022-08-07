local nvim_lsp = require'lspconfig'
local cmp = require'cmp'
local lspkind = require'lspkind'

local servers = {
    'clangd',
    'gopls',
    'cmake',
    'pyright',
    'tsserver',
    'csharp_ls',
    'vuels',
    'sumneko_lua',
    'rust_analyzer',
}

cmp.setup {
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
    },

    snippet = {
        expand = function(args)
            require'luasnip'.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),

    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
        })
    }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup{
        capabilities = capabilities,
    }
end

vim.keymap.set('n', '<C-d>', ':GoDef<CR>')

require'lspsaga'.setup {
    code_action_prompt = {
        enable = false,
        sign = false,
    },
}

require'fidget'.setup {}
