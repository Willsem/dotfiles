local capabilities = require('cmp_nvim_lsp').default_capabilities()
local navic = require('nvim-navic')

require('mason-lspconfig').setup()

vim.lsp.config('*', {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  end,
})

vim.lsp.config('lua_ls', require('configs.lspconfig.lua-ls'))
require('configs.lspconfig.brief-ls')

local signs = {
  Error = ' ',
  Warn = ' ',
  Hint = ' ',
  Info = ' ',
}

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
