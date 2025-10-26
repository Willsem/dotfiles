return {
  {
    'Bekaboo/dropbar.nvim',
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },

    opts = {
      icons = {
        kinds = {
          dir_icon = function(_)
            return '', ''
          end,
        },
      },
    },
  },
}
