local vi_mode = require("configs.heirline.components.vi-mode")
local git_branch = require("configs.heirline.components.git-branch")
local git_changes = require("configs.heirline.components.git-changes")

local alignment = require("configs.heirline.components.alignment")
local space = alignment.space
local separator = alignment.separator

return {
  vi_mode, separator, git_branch, space, git_changes,
}
