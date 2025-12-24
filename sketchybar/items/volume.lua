local colors = require("colors")
local settings = require("settings")

-- Volume indicator
local volume = sbar.add("item", "volume", {
  position = "right",
  icon = {
    string = "󰕾",  -- Unicode Volume symbol
    color = colors.white,
  },
  label = {
    string = "0%",
    color = colors.grey,
  },
})

volume:subscribe("volume_change", function(env)
  local volume_level = tonumber(env.INFO)
  local icon = "󰕾"
  
  if volume_level then
    if volume_level == 0 then
      icon = "󰖁"  -- Muted
    elseif volume_level < 30 then
      icon = "󰕿"  -- Low
    elseif volume_level < 70 then
      icon = "󰖀"  -- Medium
    else
      icon = "󰕾"  -- High
    end
    
    volume:set({
      icon = icon,
      label = volume_level .. "%"
    })
  end
end)
