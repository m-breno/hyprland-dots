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
apps=nvim

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
while read input_text
do
	case $input_text in
		1)	yay -S --needed --noconfirm $apps ;;
		2)	echo $apps ;;
		3)	read capps && yay -S --needed --noconfirm $capps ;;
	esac
done

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
		y)	    COPY=1 ;;
        s)	    COPY=1 ;;
        Y)	    COPY=1 ;;
        S)	    COPY=1 ;;
		n)	    COPY=0 ;;
        N)	    COPY=0 ;;
		*)      COPY=yes ;;
    esac
done

if [ $COPY = 1 ]
then
    cd ..
    git clone https://github.com/mbreno-op/hyprland-dots
    cd hyprland-dots
    mkdir ~/.config
    cp -rv ./config/* ~/.config/
    if [ $LANG = "pt_BR.UTF-8" ]
    then
	    echo "Pronto."
    else
	    echo "Done."
    fi
else
    if [ $LANG = "pt_BR.UTF-8" ]
    then
	    echo "Pronto."
    else
	    echo "Done."
    fi
fi
