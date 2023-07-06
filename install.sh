#!/bin/sh

#Install dependencies/Instalar dependências
if [ $LANG = "pt_BR.UTF-8" ]
then
	echo Instalando dependências e criando diretórios...
else
	echo Installing dependencies and creating directories...
fi
	
mkdir ~/temp
cd ~/temp
sudo pacman -S --needed --noconfirm git xdg-user-dirs
xdg-user-dirs-update ~/

echo "AUR helper"
if [ $LANG = "pt_BR.UTF-8" ]
then
	echo "Instalar yay ou paru? (outros: apeans escreva)"
else
	echo "Install yay or paru? (others: just type)"
fi

while read input_text
do
    case $input_text in
		yay)	AUR=yay ;;
		paru)	AUR=paru ;;
		*)      AUR=$input_text ;;
    esac
    break;
done


if [ $LANG = "pt_BR.UTF-8" ]
then
	echo Instalando $AUR...
else
	echo Installing $AUR...
fi
git clone https://aur.archlinux.org/$AUR.git 
cd $AUR
makepkg -si

#Install apps/Instalar apps
apps=neovim hyprland-git waybar-hyprland-git cava python rustup kitty fish rofi-lbonn-wayland xdg-desktop-portal-hyprland-git tty-clock-git swaylockd grim slurp starship jq dunst wl-clipboard wl-clipboard-persist-git swaylock-effects-git swww sddm-git vscodium github-desktop firefox spotify 

if [ $LANG = "pt_BR.UTF-8" ]
then
	echo Instalando aplicativos...
else
	echo Installing applications...
fi

#Install apps/Instalar apps
if [ $LANG = "pt_BR.UTF-8" ]
then
	echo "Instalar aplicativos:
    Opções:
    1) Instalar. Instala meus aplicativos. Veja (2)
    2) Listar. Lista os pacotes que serão instalados se você escolher a opção 1.
    3) Escolher. Escolha os pacotes que você quer instalar."
else
	echo "Install apps:
      Options:
      1) Install. Install my apps. See (2)
      2) List. List of packages that will be installed if you choose option 1.
      3) Choose. Choose the packages you want to install.
      Your choice:"
fi


#Copy dotfiles
if [ $LANG = "pt_BR.UTF-8" ]
then
	echo "Você quer copiar meus dotfiles? [S/n]"
else
	echo "Do you want to copy my dotfiles? [Y/n]"
fi
while read input_text
do
    case $input_text in
		y|Y|s|S|1)	    COPY=1 ;;
        n|N|0)	    COPY=0 ;;
		*)      COPY=yes ;;
    esac
    break;
done

if [ $COPY = 1 ]
then
    cd ~/temp/hyprland-dots
    mkdir ~/.config
    cp -rv ./config/* ~/.config/
    sudo systemctl enable sddm.service
    sudo cp -rv ./mirrorlist /etc/pacman.d/mirrorlist
    sudo cp -rv ./pacman.conf /etc/pacman.conf
    sudo cp -rv ./spotify.desktop /usr/share/applications/spotify.desktop

else
    
fi
if [ $LANG = "pt_BR.UTF-8" ]
    then
	    echo "Pronto."
    else
	    echo "Done."
    fi
break
