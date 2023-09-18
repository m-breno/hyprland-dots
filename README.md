# my hyprland dots

## System info
 - **OS:** Arch Linux
 - **Wayland Compositor:** Hyprland
 - **Shell:** ZSH
 - **Terminal:** Kitty
 - **Prompt:** Starship
 - **Bar:** Waybar (hyprland fork)
 - **Runner/Power menu:** Rofi
 - **Wallpaper daemon:** Hyprpaper
 - **Lockscreen:** swaylock(-effects)
 - **Editor:** VSCode/NeoVim
 - **Browser:** Firefox w/ userChrome.css

## Install instructions
### Hyprland/Starship/Waybar/
 - Create an temporary folder to organize your home (opitional):
 ```
 mkdir $HOME/tmp && cd $HOME/tmp
 ```
 - **Clone this repository:**
 ```
 git clone https://github.com/m-breno/hyprland-dots && cd ./hyprland-dots
 ```
 - **Copy the dots:**
 ```
 cp -r ./config/* ~/.config/`
 ```

### ZSH
To make the settings work with the XDG-based directories you need to:
 - **Edit `/etc/zshenv` and add the following line:**
 ```
 ZDOTDIR=$HOME/.config/zsh
 ``` 

### Firefox
 If you want to theme your firefox do the following:

 - **Open a new tab, and paste:**
 ```
 about:config
 ```
 - **Accept, then, in the input bar, paste:**
 ```
 toolkit.legacyUserProfileCustomizations.stylesheets
 ```
 - **Click the swap symbol to change the value to `true`**

 - navigate to `~/.mozilla/firefox/`your user's folder(usually *something*`.default-release`)

 - Create an folder called `chorme`

 now copy `others/userChrome.css` (in the dots folder) to `chrome/userChrome.css` (in the firefox folder)

## TODO:
- [ ] Create an install script
