return {
  'petertriho/nvim-scrollbar',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'kevinhwang91/nvim-hlslens',
  },

  opts = {
    hide_if_all_visible = true,
    excluded_filetypes = {
      'blink-cmp-menu',
      'dropbar_menu',
      'dropbar_menu_fzf',
      'DressingInput',
      'cmp_docs',
      'cmp_menu',
      'noice',
      'prompt',
      'TelescopePrompt',
      'filesystem',
      'neo-tree',
    },
    handlers = {
      cursor = false,
      diagnostic = true,
      gitsigns = true,
      handle = true,
      search = true,
      ale = false,
    },
  },
}
