local nvim_lsp = require'lspconfig'
local cmp = require'cmp'

local servers = {'clangd', 'gopls', 'cmake', 'pyright', 'tsserver', 'csharp_ls', 'vuels', 'sumneko_lua'}

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
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup{
        capabilities = capabilities,
    }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = '',
    },
  }
)

vim.cmd[[
nnoremap <C-d> :GoDef<CR>
]]

require'lspsaga'.setup()
require'fidget'.setup()
