require('catppuccin').setup({
  flavour = 'Frappe',
  transparent_background = true,
  integrations = {
    neotree = true,
    native_lsp = {
      underlines = {
        errors = { 'undercurl' },
        hints = { 'undercurl' },
        warnings = { 'undercurl' },
        information = { 'undercurl' },
      },
    },
    navic = {
      enabled = true,
    },
  },
})

vim.cmd.colorscheme('catppuccin')
