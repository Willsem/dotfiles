local map = vim.keymap.set
local lspconfig = require('lspconfig')
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

  -- local map = vim.keymap.set

  local function opts(desc)
    return { buffer = bufnr, desc = 'LSP: ' .. desc }
  end

  -- map('n', 'gD', vim.lsp.buf.declaration, opts('go to declaration'))
  -- map('n', 'gd', vim.lsp.buf.definition, opts('go to definition'))
  -- map('n', 'gi', vim.lsp.buf.implementation, opts('go to implementation'))
  -- map('n', '<leader>D', vim.lsp.buf.type_definition, opts('go to type definition'))
  -- map('n', 'gr', vim.lsp.buf.references, opts('show references'))
  -- map('n', 'K', function()
  --   return vim.lsp.buf.hover()
  -- end, opts('hover'))
  -- map('n', '<leader>ld', function()
  --   return vim.diagnostic.open_float()
  -- end, opts('diagnostic open float'))
  -- map('n', '<leader>ls', function()
  --   return vim.lsp.buf.signature_help()
  -- end, opts('show signature help'))
  -- map('i', '<c-s>', function()
  --   return vim.lsp.buf.signature_help()
  -- end, opts('show signature help'))
  -- map('n', '<leader>lr', vim.lsp.buf.rename, opts('rename'))
  --
  -- map({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, opts('code action'))
  -- map({ 'n', 'v' }, '<leader>ll', vim.lsp.codelens.run, opts('code lens'))
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Setup briefls server
lspconfig.briefls.setup({
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
