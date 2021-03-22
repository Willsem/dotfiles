autocmd BufEnter * lua require'completion'.on_attach()
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect
set shortmess+=c

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_gopls_enabled = 1
let g:go_def_mapping_enabled = 0

lua <<EOF
local nvim_lsp = require 'lspconfig'

nvim_lsp.clangd.setup {
    on_attach = require'completion'.on_attach
}

nvim_lsp.cmake.setup {
    on_attach = require'completion'.on_attach
}

nvim_lsp.pyls.setup {
    on_attach = require'completion'.on_attach
}

nvim_lsp.texlab.setup {
    on_attach = require'completion'.on_attach
}

nvim_lsp.omnisharp.setup {
    filetypes = { "cs", "fs" },
    on_attach = require'completion'.on_attach
}

nvim_lsp.ghcide.setup {
    on_attach = require'completion'.on_attach
}

nvim_lsp.gopls.setup {
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
    on_attach = require'completion'.on_attach
}

nvim_lsp.tsserver.setup{
    on_attach = require'completion'.on_attach
}

nvim_lsp.vimls.setup{
    on_attach = require'completion'.on_attach
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 4,
      prefix = '',
    },
    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = function(bufnr, client_id)
      local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
      -- No buffer local variable set, so just enable by default
      if not ok then
        return true
      end

      return result
    end,
    -- Disable a feature
    update_in_insert = false,
  }
)

require'nvim-web-devicons'.setup()
EOF
