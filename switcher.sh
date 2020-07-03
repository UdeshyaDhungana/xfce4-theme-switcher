#! /bin/zsh

# Replace the line above with your default shell

#import config file
. ~/.config/switcher.conf

#Convert rgba value to 0-255 range
LR="$(($LIGHT_RED/255.0))"
LG="$(($LIGHT_GREEN/255.0))"
LB="$(($LIGHT_BLUE/255.0))"

DR="$(($DARK_RED/255.0))"
DG="$(($DARK_GREEN/255.0))"
DB="$(($DARK_BLUE/255.0))"

# Set the variables according to the arguments

if [[ "$1" == "light" ]]; then
	#settings are same for dark
	#xfce4 settings
	xfconf-query -c xsettings -p /Net/ThemeName -s "$LIGHT_THEME"
	#icon pack
	xfconf-query -c xsettings -p /Net/IconThemeName -s "$LIGHT_ICON"
	#wallpaper change
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP-1/workspace0/last-image -s "$LIGHT_WALLPAPER"
	#This is for panel 0 only, if you have more than 1 panels repeat the code
	#below replacing panel-0 by panel-1 and so on
	#Repeat this for dark theme too
	xfconf-query -c xfce4-panel -p /panels/panel-0/background-rgba -s "$LR" -s "$LG" -s "$LB" -s "$LIGHT_OPACITY"
elif [[ "$1" == "dark" ]]; then
	xfconf-query -c xsettings -p /Net/ThemeName -s "$DARK_THEME"
	xfconf-query -c xsettings -p /Net/IconThemeName -s "$DARK_ICON"
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP-1/workspace0/last-image -s "$DARK_WALLPAPER"
	xfconf-query -c xfce4-panel -p /panels/panel-0/background-rgba -s "$DR" -s "$DG" -s "$DB" -s "$DARK_OPACITY"
fi

#restart the xfce4 panel
#this can be commented out if performance is your concern
xfce4-panel -r
