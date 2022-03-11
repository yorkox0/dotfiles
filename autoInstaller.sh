#!/bin/bash

green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

function main(){
    clear; echo -e "${red}[!] ${yellow}Bienvenid@ al programa de instalacion de mis dots personales."
    sleep 1
    # Apartados

    echo -e "\n${green}1 - ${blue}Instalar dependencias necesarias."

    echo -e "\n${green}2 - ${blue}Instalar polybar/bspwm/sxhkd/picom."

    echo -e "\n${green}3 - ${blue}Instalar temas de polybar/gtk3/rofi."

    echo -e "\n${green}4 - ${blue}Instalar todo a la vez."

    echo -e "${purple}"; read -p "-> " opcion

    if [ "$opcion" == "1" ]; then
        dependences
        fi

    if [ "$opcion" == "2" ]; then
        build
        fi

    if [ "$opcion" == "3" ]; then
        themes
        fi

    if [ "$opcion" == "4" ]; then
        dependences
        build
        themes
        fi
}

function dependences(){

    clear; echo -e "\n${green}[+] - ${blue}Instalando dependencias..."

    sudo pacman -Syyu bspwm sxhkd papirus-icon-theme xorg ruby rubygems nodejs feh go picom npm gcc pcmanfm rofi neovim nano alacritty base-devel make cmake fakeroot neofetch git python3 python2 python-pip alsa-utils binutils cbatticon volumeicon udiskie network-manager-applet lxappearance grub-customizer --noconfirm 

    mkdir /home/$USER/.config 2>/dev/null

    cp -r alacritty/ bin/ bspwm/ dunst/ fish/ gtk-2.0/ gtk-3.0/ nitrogen/ pcmanfm/ polybar/ rofi/ sxhkd/ /home/$USER/.config/ 2>/dev/null

    git clone https://aur.archlinux.org/yay.git 2>/dev/null

    chmod 777 yay/ 2>/dev/null

    cd yay/ 2>/dev/null

    makepkg -si --noconfirm 2>/dev/null

    cd .. 2>/dev/null

    sudo rm -rf yay/ 2>/dev/null

}

function build(){
    yay -S polybar --noconfirm

    yay -S nerd-fonts-complete --noconfirm

}

function themes(){
    pip install pycritty 2>/dev/null

    /home/$USER/.local/bin/pycritty -s 16 -f Caskaydia -t dracula -o 0.8 2>/dev/null

    /home/$USER/.local/bin/pycritty -p 20 20 2>/dev/null

    echo "picom &" >> ~/.xprofile 2>/dev/null

    cp -r .wallpapers/ /home/$USER/.wallpapers/ 2>/dev/null

    git clone https://github.com/davatorium/rofi-themes.git 2>/dev/null
    sudo cp rofi-themes/User\ Themes/onedark.rasi /usr/share/rofi/themes 2>/dev/null
    
    cp -r rofi/ ~/.config/ 2>/dev/null

    chmod +x ~/.config/bspwm/bspwmrc 2>/dev/null

    chmod +x ~/.config/polybar/* 2>/dev/null
    
    yay -S arc-solid-gtk-theme --noconfirm 2>/dev/null

    git clone https://github.com/antoniosarosi/dotfiles 2>/dev/null

    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    cp -r dotfiles/.config/nvim/ ~/.config/ 2>/dev/null

    pip install neovim 2>/dev/null
    sudo npm i -g neovim 2>/dev/null

    sudo pacman -S neovim 2>/dev/null

    sudo rm -r dotfiles/ 2>/dev/null

}
main
