local colors   = require("colors")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

-- Front‑app indicator (shows the active application's icon)
local front_app = sbar.add("item", "front_app", {
  position = "right",
  drawing = true,
  icon = {
    string = ":default:",          -- fallback glyph
    font   = "sketchybar-app-font", -- use the app‑font for logos
    color  = colors.white,
    size   = 16,                    -- adjust size as you like
  },
  label = { drawing = false },
})

-- Update whenever the frontmost app changes
front_app:subscribe("front_app_switched", function(env)
  local app_name = env.INFO               -- env.INFO is the app name string
  local glyph = app_icons[app_name] or ":default:"
  front_app:set({ icon = { string = glyph } })
end)
