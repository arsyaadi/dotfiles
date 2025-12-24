local colors = require("colors")
local settings = require("settings")

-- WiFi indicator with speed monitoring
local wifi = sbar.add("item", "wifi", {
  position = "right",
  icon = {
    string = "↓-- ↑--",
    color = colors.white,
  },
  label = {
    string = "󰖩 Loading...",
    color = colors.grey,
  },
  update_freq = 3,
})

-- Variables to track network bytes
local prev_down = 0
local prev_up = 0

wifi:subscribe({ "wifi_change", "forced", "routine" }, function(env)
  -- Get network statistics
  sbar.exec("netstat -ibn | grep -e en0 -m 1 | awk '{print $7, $10}'", function(result)
    local current_down, current_up = result:match("(%d+)%s+(%d+)")
    
    if current_down and current_up then
      current_down = tonumber(current_down)
      current_up = tonumber(current_up)
      
      -- Calculate speeds (bytes per update interval)
      local down_speed = 0
      local up_speed = 0
      
      if prev_down > 0 then
        down_speed = (current_down - prev_down) / 3
        up_speed = (current_up - prev_up) / 3
      end
      
      prev_down = current_down
      prev_up = current_up
      
      -- Format speeds
      local function format_speed(bytes_per_sec)
        if bytes_per_sec < 1024 then
          return string.format("%.0fB", bytes_per_sec)
        elseif bytes_per_sec < 1024 * 1024 then
          return string.format("%.0fK", bytes_per_sec / 1024)
        else
          return string.format("%.1fM", bytes_per_sec / (1024 * 1024))
        end
      end
      
      local down_str = format_speed(down_speed)
      local up_str = format_speed(up_speed)
      
      -- Get WiFi SSID
      sbar.exec("ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}'", function(ssid)
        local wifi_name = ssid and ssid ~= "" and ssid or "Off"
        wifi_name = wifi_name:gsub("^%s*(.-)%s*$", "%1") -- trim whitespace
        
        -- Format: speeds in icon, wifi symbol + name in label
        if wifi_name ~= "Off" then
          wifi:set({ 
            icon = string.format("↓%s ↑%s", down_str, up_str),
            label = string.format("󰖩 %s", wifi_name)
          })
        else
          wifi:set({ 
            icon = "↓0 ↑0",
            label = "󰖩 Off" 
          })
        end
      end)
    end
  end)
end)
