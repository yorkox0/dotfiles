#!/bin/bash

function main(){

  sudo pacman -Syyu bspwm sxhkd papirus-icon-theme xorg ruby rubygems nodejs feh go picom npm firefox gcc qtile pcmanfm rofi neovim nano lightdm lightdm-webkit2-greeter alacritty base-devel make cmake fakeroot neofetch git python3 python2 python-pip alsa-utils binutils cbatticon volumeicon udiskie network-manager-applet lxappearance --noconfirm
  
  cp -r alacritty/ bin/ bspwm/ dunst/ fish/ gtk-2.0/ gtk-3.0/ nitrogen/ pcmanfm/ polybar/ rofi/ sxhkd/ /home/$USER/.config/
  
  git clone https://aur.archlinux.org/yay.git

  chmod 777 yay/

  cd yay/

  makepkg -si
  
  cd ..
  
  sudo rm -r yay/
  
  yay -S polybar --noconfirm
  
  yay -S nerd-fonts-complete --noconfirm
  
  pip install pycritty
  
  pycritty -s 16 -f Caskaydia -t dracula -o 0.8

  pycritty -p 12 12
  
  echo "picom &" >> ~/.xprofile
  
  cp -r .wallpapers/ /home/$USER/.wallpapers/
  
  cp -r .sounds/ /home/$USER/
  
  git clone https://github.com/davatorium/rofi-themes.git
  sudo cp rofi-themes/User\ Themes/onedark.rasi /usr/share/rofi/themes

  cp -r dotfiles/.config/rofi ~/.config

  yay -S lightdm-webkit2-greeter --noconfirm
  
  sudo systemctl enable --now lightdm

}

if [ "$(id -u)" == "0" ]; then
	echo -e "\n${red}[!] No hay que ser root para ejecutar la herramienta${end}"
	echo
	exit 1
else
  main
fi
