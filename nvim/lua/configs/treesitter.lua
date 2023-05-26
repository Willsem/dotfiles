require("nvim-treesitter.configs").setup({
    ensure_installed = {"lua", "go", "javascript", "typescript", "tsx"},
    highlight = {enable = true, additional_vim_regex_highlighting = false},
    context_commentstring = {enable = true, enable_autocmd = false},
    rainbow = {
        enable = true,
        disable = {"html"},
        extended_mode = false,
        max_file_lines = nil
    },
    autotag = {enable = true},
    incremental_selection = {enable = true},
    indent = {enable = false},
    refactor = {
        highlight_definitions = {enable = true, clear_on_cursor_move = true}
    }
})
