#!/bin/sh
echo "--- Instalando tmux ---"
if [ -x $(command -v tmux) ]; then 
    sudo apt-get install tmux;
fi
