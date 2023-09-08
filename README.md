# my hyprland dots

## System info
 - **OS:** Arch Linux
 - **Wayland Compositor:** Hyprland
 - **Bar:** Waybar (hyprland fork)
 - **Runner:** Rofi
 - **Wallpaper daemon:** Hyprpaper
 - **Lockscreen:** TODO: add a lockscreen
 - **Editor:** VSCode/NeoVim
 - **Browser:** Firefox w/ userChrome.css

## Install instructions
 - Clone this repository:
 ```
 mkdir tmp && cd tmp && git clone https://github.com/m-breno/hyprland-dots && cd ./hyprland-dots
 ```
 - Copy the dots:
 ```
 cp -r ./config/* ~/.config/`
 ```

## Firefox
 If you want to theme your firefox do the following:

 - Open a new tab, and paste:
 ```
 about:config
 ```
 Accept, then, in the input bar, paste:
 ```
 toolkit.legacyUserProfileCustomizations.stylesheets
 ```
 and click the swap symbol to change to `true`

## TODO:
- [ ] Create an install script
