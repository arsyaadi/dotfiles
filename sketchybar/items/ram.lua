local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

local ram = sbar.add("item", "ram", {
  position = "right",
  icon = {
    string = "RAM",
    color = colors.white,
  },
  label = {
    string = "RAM: ??%",
    color = colors.grey,
  },
  update_freq = 2,
})

ram:subscribe({"routine", "forced"}, function(env)
  sbar.exec("ps -A -o %mem | awk '{s+=$1} END {print s}'", function(result)
    local ram_percent = tonumber(result)
    if ram_percent then
      ram:set({ label = string.format(": %.0f%%", ram_percent) })
    end
  end)
end)
