-- Apply vim options
require('core.options')

-- Load plugins
local plugins = require('core.plugins')

-- Initialize plugin manager
require('core.plugin-manager').setup(plugins)
