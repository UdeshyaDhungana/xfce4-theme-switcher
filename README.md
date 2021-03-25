# xfce4-theme-switcher

Created for switching between light and dark theme.

It can change following

 - xfce4-theme
 - icon pack
 - wallpaper
 - xfce4-panel colors
 - xfce4 window manager theme

## Installation

- Clone the repo
- Place `switch.conf`  in  `~/.config` [ Create the folder if it does not exist ]
- Place `switcher` in `~/.local/bin`[ Or any folder which is a `$PATH` variable ]
- Make the script file executable by running
```
$ chmod +x switch
```

## config

Follow the instructions in `switch.conf` file
Provide all necessary variables

## Usage

```
$ switch [option]
```
where option is either `light` or `dark`

## Note

It might be that with your default xfce4 settings, you might not have the 
option to set custom panel color. Run this command to check if the panel
property exists (if output is blank, the property does not exist):

`$ xfconf-query -c xfce4-panel -l | grep "background-rgba"`

While your default changes will change the panel color based on the theme
itself, if you want to provide custom coloring and don't have the 
`background-rgba` property, use this command to create it:

`$ xfconf-query -c xfce4-panel -p /panels/panel-1/background-rgba -n -t string -t string -t string -t string -s 255 -s 255 -s 255 -s 1`

This will create the rgba property and initialize `panel-1` (use your panel code 
above in `/panels/panel-1/background-rgba`) to all black (255,255,255,255) color. 
You can override the color after you run switch and through switch.conf.

---
I am a beginner. So, please report bugs! 😊
