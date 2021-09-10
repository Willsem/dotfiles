local lspconfig = require('lspconfig');
local completion = require('completion');

vim.cmd[[
autocmd BufEnter * lua require'completion'.on_attach()
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect
set shortmess+=c
]]

lspconfig.clangd.setup {
    on_attach = completion.on_attach
}

lspconfig.gopls.setup {
    on_attach = completion.on_attach
}

lspconfig.pyls.setup {
    on_attach = completion.on_attach
}

lspconfig.cmake.setup {
    on_attach = completion.on_attach
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = ' ',
    },
  }
)
