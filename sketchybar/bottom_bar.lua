-- Require the sketchybar module
sbar = require("sketchybar")
require("colors")
require("settings")
require("icons")

-- Bundle the entire initial configuration into a single message to sketchybar
sbar.begin_config()

-- Set the bar position to bottom
sbar.bar({ position = "bottom" })

-- Load the spaces items
require("items.spaces")

sbar.end_config()

-- Run the event loop
sbar.event_loop()
