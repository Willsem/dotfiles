require("catppuccin").setup({
  integrations = {
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    neotree = true,
    telescope = true,
    treesitter = true,
    treesitter_context = false,
    gitsigns = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    notify = true,
    which_key = true,
  }
})

vim.cmd.colorscheme("catppuccin")
