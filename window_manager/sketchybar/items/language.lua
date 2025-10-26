local strings = require("strings")

local item = sbar.add("item", {
  position = "right",
  label = {
    string = "??",
  },
})

local function input_change()
  sbar.exec(
    "defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' | awk -F' ' '{print $4}' | sed 's/.$//'",
    function(result, code)
      local lang = strings.trim(result)

      local label = "??"
      if lang == "Russian" then
        label = "RU"
      elseif lang == "ABC" then
        label = "EN"
      end

      item:set({
        label = label,
      })
    end
  )
end

sbar.add("event", "input_source_changed", "AppleSelectedInputSourcesChangedNotification")
item:subscribe("input_source_changed", input_change)
