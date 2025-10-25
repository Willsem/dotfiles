return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  config = function()
    local actions = require('telescope.actions')
    local icons = require('nvim-nonicons')

    require('telescope').setup({
      defaults = {
        prompt_prefix = '  ' .. icons.get('telescope') .. '  ',
        selection_caret = ' ❯ ',
        entry_prefix = '   ',
        mappings = {
          i = {
            ['<C-n>'] = actions.cycle_history_next,
            ['<C-p>'] = actions.cycle_history_prev,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
          },
          n = {
            ['q'] = actions.close,
          },
        },
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.65,
          },
          vertical = {
            mirror = false,
          },
          width = 0.95,
          height = 0.95,
          preview_cutoff = 120,
        },
      },
    })
  end,
}
