return {
  'jinzhongjia/LspUI.nvim',
  dependencies = {
    {
      'OXY2DEV/markview.nvim',
      lazy = false,
    },
  },
  branch = 'main',

  opts = {
    lightbulb = {
      enable = false,
      command_enable = false,
    },
  },
}
