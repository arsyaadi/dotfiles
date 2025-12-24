return {
  black = 0xff1a1a2e,
  white = 0xffffb3d9,  -- Soft pink white
  red = 0xffff6b9d,    -- Pink red
  green = 0xffb4f8c8,  -- Mint green
  blue = 0xffa0c4ff,   -- Pastel blue
  yellow = 0xfffff4a3, -- Pastel yellow
  orange = 0xffffadad, -- Peachy pink
  magenta = 0xffff9ff3, -- Bright pink
  grey = 0xffcdb4db,   -- Lavender grey
  transparent = 0x00000000,

  bar = {
    bg = 0xcc1a1a2e,       -- Semi-transparent dark navy
    border = 0xffff9ff3,   -- Pink border
  },
  popup = {
    bg = 0xee2d2d44,       -- Dark purple-navy
    border = 0xffff9ff3,   -- Pink border
  },
  bg1 = 0xff2d2d44,        -- Dark purple-navy
  bg2 = 0xff1a1a2e,        -- Darker navy

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
