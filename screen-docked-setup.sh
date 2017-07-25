# Turn off laptop screen
xrandr --output LVDS1 --off

# Enable the two main screens
xrandr --output DP1 --auto --left-of VGA1
xrandr --output VGA1 --auto --right-of DP1

# Refresh background image
~/.fehbg
