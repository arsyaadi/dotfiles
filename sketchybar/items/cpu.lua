local colors = require("colors")
local settings = require("settings")

-- CPU indicator
local cpu = sbar.add("item", "cpu", {
  position = "right",
  icon = {
    string = "󰻠",  -- CPU icon
    color = colors.white,
  },
  label = {
    string = "??%",
    color = colors.grey,
  },
  update_freq = 2,
})

cpu:subscribe({"routine", "forced"}, function(env)
  sbar.exec("ps -A -o %cpu | awk '{s+=$1} END {printf \"%.0f%%\", s}'", function(result)
    local cpu_percent = result:gsub("%%", "")
    cpu:set({ label = result })
  end)
end)
