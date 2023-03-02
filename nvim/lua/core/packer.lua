local P = {}

local bootstrap = require("core.bootstrap")
local packer = require("packer")

function P.load(plugins)
  return packer.startup(function(use)
    for _, plugin in ipairs(plugins) do
      use(plugin)
    end

    if bootstrap then
      packer.sync()
    end
  end)
end

return P
