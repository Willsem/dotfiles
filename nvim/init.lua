local plugins = require("core.plugins")
local packer = require("core.packer")
packer.load(plugins)

local packages = {
  "core.options",
}

for _, package in ipairs(packages) do
  require(package)
end
