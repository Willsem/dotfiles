local colors = require("colors.heirline")
require("heirline").load_colors(colors)

local alignment = require("configs.heirline.alignment")
local align = alignment.align
local space = alignment.space

local vi_mode = require("configs.heirline.vi-mode")
local git_branch = require("configs.heirline.git-branch")
local git_changes = require("configs.heirline.git-changes")

local lsp_active = require("configs.heirline.lsp-active")
local line_number = require("configs.heirline.line-number")
local scrollbar = require("configs.heirline.scrollbar")

require("heirline").setup({
  statusline = {
    vi_mode, space, git_branch, space, git_changes,
    align,
    lsp_active, space, line_number, space, scrollbar, space, vi_mode,
  },
})
