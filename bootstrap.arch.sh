#!/bin/bash

pacman -S firefox-developer-edition git zsh neovim docker xclip gnome-tweak-tool the_silver_searcher autojump ctags

systemctl start docker && systemctl enable docker

curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

env zsh && chsh -s $(grep /zsh$ /etc/shells | tail -1)

curl -L http://install.ohmyz.sh
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions/

git clone git@github.com:aaron-williamson/base16-gnome-terminal.git ~/.gnome-colors/
bash ~/.gnome-colors/base16-gnome-terminal/color-scripts/base16-atelier-heath.sh

git clone https://aur.archlinux.org/nerd-fonts-complete.git ~/.nerd-fonts/
cd ~/.nerd-fonts/ && makepkg -si

git clone https://aur.archlinux.org/spotify.git ~/Downloads/spotify
cd ~/.Downloads/spotify/ && makepkg -si
