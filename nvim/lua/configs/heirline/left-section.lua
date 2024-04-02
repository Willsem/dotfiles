local vi_mode = require('configs.heirline.components.vi-mode')
local git = require('configs.heirline.components.git')
local diagnostics = require('configs.heirline.components.diagnostics')
local file_name = require('configs.heirline.components.file-name')

return {
  vi_mode,
  git,
  diagnostics,
  file_name,
}
