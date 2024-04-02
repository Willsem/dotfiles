require('mason-lspconfig').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local navic = require('nvim-navic')

require('mason-lspconfig').setup_handlers({
  function(server_name)
    local settings = {}

    if server_name == 'lua_ls' then
      settings = require('configs.lspconfig.lua-ls')
    end

    settings.capabilities = capabilities
    settings.on_attach = function(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
      end
    end

    require('lspconfig')[server_name].setup(settings)
  end,
})

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
