require("mason-null-ls").setup({automatic_setup = true})

require("mason-null-ls").setup_handlers {
    function(source_name, methods)
        require("mason-null-ls.automatic_setup")(source_name, methods)
    end
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    return vim.lsp.buf.format({bufnr = bufnr})
                end
            })
        end
    end
})
