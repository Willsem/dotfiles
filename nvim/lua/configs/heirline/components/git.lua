local conditions = require('heirline.conditions')

local alignment = require('configs.heirline.components.alignment')
local git_branch = require('configs.heirline.components.git-branch')
local git_changes = require('configs.heirline.components.git-changes')

return {
  condition = conditions.is_git_repo,
  alignment.separator,
  git_branch,
  git_changes,
}
