local alignment = require('configs.heirline.components.alignment')

return {
  alignment.space,
  {
    init = function(self)
      self.mode = vim.api.nvim_get_mode().mode
      if not self.once then
        vim.api.nvim_create_autocmd('ModeChanged', {
          pattern = '*:*o',
          command = 'redrawstatus',
        })
        self.once = true
      end
    end,
    static = {
      mode_colors = {
        n = 'mode_normal',
        i = 'mode_insert',
        v = 'mode_visual',
        V = 'mode_visual',
        ['\22'] = 'mode_visual',
        c = 'mode_cmd',
        s = 'mode_select',
        S = 'mode_select',
        ['\19'] = 'mode_cmd',
        R = 'mode_replace',
        r = 'mode_replace',
        ['!'] = 'mode_normal',
        t = 'mode_terminal',
      },
      mode_text = {
        n = ' ',
        i = ' ',
        v = ' ',
        V = ' ',
        ['\22'] = ' ',
        c = ' ',
        s = ' ',
        S = ' ',
        ['\19'] = ' ',
        R = ' ',
        r = ' ',
        ['!'] = ' ',
        t = ' ',
      },
    },
    provider = function(self)
      local mode = self.mode:sub(1, 1)
      return self.mode_text[mode]
    end,
    hl = function(self)
      local mode = self.mode:sub(1, 1)
      return {
        bg = 'bg',
        fg = self.mode_colors[mode],
      }
    end,
    update = { 'ModeChanged' },
  },
}
