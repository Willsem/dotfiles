local alignment = require('configs.heirline.components.alignment')

return {
  {
    static = {
      enabled = function(bufnr)
        if type(bufnr) == 'table' then
          bufnr = bufnr.bufnr
        end
        local parsers = require('nvim-treesitter.parsers')
        return parsers.has_parser(parsers.get_buf_lang(bufnr or vim.api.nvim_get_current_buf()))
      end,
    },
    provider = function(self)
      local icon = ' '
      if self.enabled(self.bufnr) then
        icon = ' '
      end
      return icon .. 'TS'
    end,
    hl = {
      fg = 'treesitter',
      bg = 'bg',
    },
  },
  alignment.separator,
}
