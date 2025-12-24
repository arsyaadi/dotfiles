local colors = require("colors")
local settings = require("settings")

-- Bluetooth indicator
local bluetooth = sbar.add("item", "bluetooth", {
  position = "right",
  icon = {
    string = "󰂯", -- Unicode Bluetooth symbol
    color = colors.white,
  },
  label = {
    string = "Off",
    color = colors.grey,
  },
  update_freq = 5,
})

bluetooth:subscribe({ "forced", "routine" }, function(env)
  sbar.exec(
    "system_profiler SPBluetoothDataType | awk '/Connected:/ {flag=1; next} /Not Connected:/ {flag=0} flag && /:/ {gsub(/^ *|:$/, \"\"); print; exit}'",
    function(status)
      local label = status
      if label == "" then
        label = "Off"
      end
      bluetooth:set({ label = label })
    end)
end)
