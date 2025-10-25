local conditions = require('heirline.conditions')

local alignment = require('plugins.heirline.components.alignment')

return {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,

  hl = { bg = 'bg' },

  {
    condition = function(self)
      local added_count = self.status_dict.added or 0
      local changed_count = self.status_dict.changed or 0
      local deleted_count = self.status_dict.removed or 0

      return added_count > 0 or changed_count > 0 or deleted_count > 0
    end,
    alignment.space,
  },

  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and (' ' .. count)
    end,
    hl = { fg = 'git_add' },
  },
  {
    condition = function(self)
      local added_count = self.status_dict.added or 0
      local changed_count = self.status_dict.changed or 0
      local deleted_count = self.status_dict.removed or 0

      return added_count > 0 and (changed_count > 0 or deleted_count > 0)
    end,
    alignment.space,
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and (' ' .. count)
    end,
    hl = { fg = 'git_change' },
  },
  {
    condition = function(self)
      local changed_count = self.status_dict.changed or 0
      local deleted_count = self.status_dict.removed or 0

      return changed_count > 0 and deleted_count > 0
    end,
    alignment.space,
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and (' ' .. count)
    end,
    hl = { fg = 'git_del' },
  },
}
