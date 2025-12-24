local colors = require("colors")
local settings = require("settings")

-- Battery indicator
local battery = sbar.add("item", "battery", {
  position = "right",
  icon = {
    string = "󰁹",  -- Battery icon
    color = colors.white,
  },
  label = {
    string = "??%",
    color = colors.grey,
  },
  update_freq = 120,
})

battery:subscribe({"routine", "power_source_change", "system_woke"}, function(env)
  sbar.exec("pmset -g batt | grep -Eo '\\d+%' | cut -d% -f1", function(batt_percent)
    local percentage = tonumber(batt_percent)
    local icon = "󰁹"
    
    if percentage then
      if percentage >= 90 then
        icon = "󰁹"  -- Full
      elseif percentage >= 60 then
        icon = "󰂀"  -- 75%
      elseif percentage >= 40 then
        icon = "󰁾"  -- 50%
      elseif percentage >= 20 then
        icon = "󰁼"  -- 25%
      else
        icon = "󰁺"  -- Low
      end
      
      battery:set({
        icon = icon,
        label = batt_percent .. "%"
      })
    end
  end)
end)
