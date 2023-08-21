require("catppuccin").setup({
    integrations = {
        native_lsp = {
            enabled = true,
            underlines = {
                errors = {"undercurl"},
                hints = {"undercurl"},
                warnings = {"undercurl"},
                information = {"undercurl"}
            }
        },
        neotree = true,
        telescope = true,
        treesitter = true,
        treesitter_context = false,
        gitsigns = true,
        indent_blankline = {enabled = true, colored_indent_levels = false},
        notify = true,
        which_key = true
    }
})

vim.cmd.colorscheme("catppuccin")
