local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local alignment = require('configs.heirline.components.alignment')

local FileNameBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}

local FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ':e')
    self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. ' ')
  end,
  hl = function(self)
    return {
      fg = self.icon_color,
      bg = 'bg',
    }
  end,
}

local FileName = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ':.')
    if filename == '' then
      return 'No Name'
    end
    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename
  end,
  hl = {
    fg = utils.get_highlight('Directory').fg,
    bg = 'bg',
  },
}

local FileFlags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    alignment.space,
    {
      provider = '[+]',
      hl = {
        fg = 'modified',
        bg = 'bg',
      },
    },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    alignment.space,
    {
      provider = '',
      hl = {
        fg = 'file_locked',
        bg = 'bg',
      },
    },
  },
}

local FileNameModifer = {
  hl = function()
    if vim.bo.modified then
      return {
        fg = 'modified',
        bg = 'bg',
        bold = true,
        force = true,
      }
    end
  end,
}

return {
  alignment.separator,
  utils.insert(FileNameBlock, FileIcon, utils.insert(FileNameModifer, FileName), FileFlags, { provider = '%<' }),
}
