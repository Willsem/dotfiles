local configs = require('lspconfig.configs')
local util = require('lspconfig.util')
local navic = require('nvim-navic')

-- Inject Brief LSP
if not configs.briefls then
  configs.briefls = {
    default_config = {
      cmd = { 'briefls' },
      filetypes = { 'brief' },
      root_dir = function(fname)
        return util.root_pattern('.git')(fname)
      end,
      single_file_support = true,
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = true,
          },
        },
      },
    },
    settings = {},
  }
end

-- This function will be called when the LSP server is attached to the buffer.
-- In this case, it describes the creation of mappings related to LSP capabilities.
local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Setup briefls server
vim.lsp.config('briefls', {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = capabilities,
})

vim.filetype.add({
  extension = {
    brief = 'brief',
  },
})
