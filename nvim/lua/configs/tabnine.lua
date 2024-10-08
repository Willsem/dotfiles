require('tabnine').setup({
  disable_auto_comment = true,
  accept_keymap = '<C-s>',
  dismiss_keymap = '<C-]>',
  debounce_ms = 800,
  suggestion_color = { gui = '#808080', cterm = 244 },
  exclude_filetypes = { 'TelescopePrompt', 'Neotree' },
  log_file_path = nil,
  ignore_certificate_errors = false,
})
