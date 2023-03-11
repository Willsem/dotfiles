local vi_mode = require("configs.heirline.components.vi-mode")
local git_branch = require("configs.heirline.components.git-branch")
local git_changes = require("configs.heirline.components.git-changes")

local alignment = require("configs.heirline.components.alignment")
local space = alignment.space

return {
  vi_mode, space, git_branch, space, git_changes,
}
