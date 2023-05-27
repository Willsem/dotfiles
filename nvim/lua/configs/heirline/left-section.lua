local vi_mode = require("configs.heirline.components.vi-mode")
local git_branch = require("configs.heirline.components.git-branch")
local git_changes = require("configs.heirline.components.git-changes")
local diagnostics = require("configs.heirline.components.diagnostics")

local alignment = require("configs.heirline.components.alignment")
local separator = alignment.separator

return {
    vi_mode, separator, git_branch, separator, git_changes, separator,
    diagnostics
}
