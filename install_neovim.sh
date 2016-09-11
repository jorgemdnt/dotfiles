#!/bin/sh

echo "-- Iniciar instalacao neovim --"
if ! [ -x $(command -v nvim) ]; then
    echo "-- Instalando neovim --"
    echo `sudo apt-get install software-properties-common`
    echo `sudo add-apt-repository ppa:neovim-ppa/unstable`
    echo `sudo apt-get update`
    echo `sudo apt-get install neovim`
    echo `sudo apt-get install python-dev python-pip python3-dev python3-pip`
    echo `sudo pip install neovim jedi`
else
    echo "-- Neovim ja instalado --"
fi
