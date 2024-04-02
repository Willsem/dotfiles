local alignment = require('configs.heirline.components.alignment')

return {
  {
    provider = '%P',
    hl = {
      bg = 'bg',
      fg = 'fg',
    },
  },
  alignment.space,
  {
    static = {
      sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' },
    },
    provider = function(self)
      local curr_line = vim.api.nvim_win_get_cursor(0)[1]
      local lines = vim.api.nvim_buf_line_count(0)
      local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
      return string.rep(self.sbar[i], 2)
    end,
    hl = { fg = 'scrollbar', bg = 'bg' },
  },
  alignment.space,
}
