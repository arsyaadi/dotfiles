local colors = require("colors")

-- Media cover/artwork
local media_cover = sbar.add("item", {
  position = "left",
  max_width = 80,  -- larger cover width
  background = {
    image = {
      string = "media.artwork",
      scale = 0.8,  -- larger thumbnail
    },
    color = colors.transparent,
  },
  label = { drawing = false },
  icon = { drawing = false },
  drawing = false,
  updates = true,
})

-- Media title
local media_title = sbar.add("item", {
  position = "left",
  drawing = false,
  padding_left = 3,
  max_width = 100,
  icon = {
    string = "󰎈",
    color = colors.magenta,
    max_width = 20,
  },
  label = {
    string = "",
    color = colors.white,
    max_chars = 30,
    max_width = 50,
  },
})

-- Handle media change events (works with Spotify, Apple Music, etc.)
media_cover:subscribe("media_change", function(env)
  if env.INFO.state == "playing" then
    local display = env.INFO.title or "Unknown"
    if env.INFO.artist and env.INFO.artist ~= "" then
      display = env.INFO.artist .. " - " .. display
    end
    
    media_title:set({ 
      label = display,
      drawing = true 
    })
    media_cover:set({ drawing = true })
  else
    media_title:set({ 
      label = "Not Playing",
      drawing = true 
    })
    media_cover:set({ drawing = false })
  end
end)
