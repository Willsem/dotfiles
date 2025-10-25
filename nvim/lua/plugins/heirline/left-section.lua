local vi_mode = require('plugins.heirline.components.vi-mode')
local git = require('plugins.heirline.components.git')
local diagnostics = require('plugins.heirline.components.diagnostics')
local file_name = require('plugins.heirline.components.file-name')

return {
  vi_mode,
  git,
  diagnostics,
  file_name,
}
