#!/bin/bash

export WHITE=0xffffffff

# -- Teal Scheme --
# export BAR_COLOR=0xff001f30
# export ITEM_BG_COLOR=0xff003547
# export ACCENT_COLOR=0xff2cf9ed

# -- Gray Scheme --
# export BAR_COLOR=0xff101314
# export ITEM_BG_COLOR=0xff353c3f
# export ACCENT_COLOR=0xffffffff

# -- Purple Scheme --
# export BAR_COLOR=0xff140c42
# export ITEM_BG_COLOR=0xff2b1c84
# export ACCENT_COLOR=0xffeb46f9

# -- Red Scheme ---
# export BAR_COLOR=0xff23090e
# export ITEM_BG_COLOR=0xff591221
# export ACCENT_COLOR=0xffff2453

# -- Blue Scheme --- 
# export BAR_COLOR=0xff021254
# export ITEM_BG_COLOR=0xff093aa8
# export ACCENT_COLOR=0xff15bdf9

# -- Green Scheme --
# export BAR_COLOR=0xff003315
# export ITEM_BG_COLOR=0xff008c39
# export ACCENT_COLOR=0xff1dfca1


# -- Orange Scheme --
# export BAR_COLOR=0xff381c02
# export ITEM_BG_COLOR=0xff99440a
# export ACCENT_COLOR=0xfff97716

# -- Yellow Scheme --
# export BAR_COLOR=0xff2d2b02
# export ITEM_BG_COLOR=0xff8e7e0a
# export ACCENT_COLOR=0xfff7fc17


# # -- Dark/Black Scheme --
# export BAR_COLOR=0xff000000       # Pure black
# export ITEM_BG_COLOR=0xff1a1a1a   # Very dark gray, almost black
# export ACCENT_COLOR=0xff4a4a4a    # Medium gray for contrast

# -- Dark Blue-Gray Scheme --
# export BAR_COLOR=0xff0a0a10       # Very dark blue-gray
# export ITEM_BG_COLOR=0xff1a1a20   # Dark blue-gray
# export ACCENT_COLOR=0xff4a4a55    # Medium blue-gray
 
# -- Alternative Dark Scheme --
export BAR_COLOR=0xff0a0a0a       # Near-black
export ITEM_BG_COLOR=0xff2a2a2a   # Dark gray
export ACCENT_COLOR=0xff808080    # Light gray for more contrast



export ROSEWATER=0xFFf5e0dc #f5e0dc
export FLAMINGO=0xFFf2cdcd #f2cdcd
export PINK=0xFFf5c2e7 #f5c2e7
export MAUVE=0xFFcba6f7 #cba6f7
export RED=0xFFf38ba8 #f38ba8
export MAROON=0xFFeba0ac #eba0ac
export PEACH=0xFFfab387 #fab387
export YELLOW=0xFFf9e2af #f9e2af
export GREEN=0xFFa6e3a1 #a6e3a1
export TEAL=0xFF94e2d5 #94e2d5
export SKY=0xFF89dceb #89dceb
export SAPPHIRE=0xFF74c7ec #74c7ec
export BLUE=0xFF89b4fa #89b4fa
export LAVENDER=0xFFb4befe #b4befe

export WHITE=0xFFcdd6f4 #cdd6f4 
export DARK_WHITE=0xFF9399b2  #9399b2

export BG_PRI_COLR=0xEE1e1e2e #1e1e2e
export BG_SEC_COLR=0xFF313244 #313244


export BASE=0xff24273a
export MANTLE=0xff1e2030
export CRUST=0xff181926

export TEXT=0xffcad3f5
export SUBTEXT0=0xffb8c0e0
export SUBTEXT1=0xffa5adcb

export SURFACE0=0xff363a4f
export SURFACE1=0xff494d64
export SURFACE2=0xff5b6078

export OVERLAY0=0xff6e738d
export OVERLAY1=0xff8087a2
export OVERLAY2=0xff939ab7

export BLUE=0xff8aadf4
export LAVENDER=0xffb7bdf8
export SAPPHIRE=0xff7dc4e4
export SKY=0xff91d7e3
export TEAL=0xff8bd5ca
export GREEN=0xffa6da95
export YELLOW=0xffeed49f
export PEACH=0xfff5a97f
export MAROON=0xffee99a0
export RED=0xffed8796
export MAUVE=0xffc6a0f6
export PINK=0xfff5bde6
export FLAMINGO=0xfff0c6c6
export ROSEWATER=0xfff4dbd6

export RANDOM_CAT_COLOR=("$BLUE" "$LAVENDER" "$SAPPHIRE" "$SKY" "$TEAL" "$GREEN" "$YELLOW" "$PEACH" "$MAROON" "$RED" "$MAUVE" "$PINK" "$FLAMINGO" "$ROSEWATER")

function getRandomCatColor() {
  echo "${RANDOM_CAT_COLOR[ $RANDOM % ${#RANDOM_CAT_COLOR[@]} ]}"
}

#
# LEGACY COLORS 
#
# Color Palette
export GREY=0xff939ab7
export TRANSPARENT=0x00000000

# General bar colors
export BAR_COLOR=$BASE
export ICON_COLOR=$TEXT # Color of all icons
export LABEL_COLOR=$TEXT # Color of all labels

