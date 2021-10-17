#!/bin/bash

function main(){

  sudo pacman -Syyu bspwm sxhkd polybar papirus-icon-theme xorg ruby rubygems nodejs feh go picom npm firefox gcc qtile pcmanfm rofi neovim nano lightdm lightdm-webkit2-greeter alacritty base-devel make cmake fakeroot neofetch git python3 python2 python-pip alsa-utils binutils cbatticon volumeicon udiskie network-manager-applet lxappearance --noconfirm
  
  git clone https://aur.archlinux.org/yay.git

  chmod 777 yay/

  cd yay/

  makepkg -si
  
  cd ..
  
  sudo rm -r yay/
  
  yay -S nerd-fonts-complete --noconfirm
  
  pip install pycritty
  
  pycritty -s 16 -f Caskaydia -t dracula -o 0.8

  pycritty -p 12 12
  
  echo "picom &" >> ~/.xprofile
  
  

}
