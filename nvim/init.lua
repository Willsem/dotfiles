local packages = {
  "core.options",
}

for _, package in ipairs(packages) do
  require(package)
end

local plugins = require("core.plugins")
local lazy = require("core.lazy")
lazy.load(plugins)
