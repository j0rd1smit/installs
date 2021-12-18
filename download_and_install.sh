#!/bin/sh

STARTING_FOLDER="$(pwd)"

git clone https://github.com/j0rd1smit/dotfiles.git ~/.dotfiles
~/.dotfiles/install

git clone https://github.com/j0rd1smit/dotfiles-local.git ~/.dotfiles-local
cd ~/.dotfiles-local
git switch -c "$(hostname)"
~/.dotfiles-local/install
cd STARTING_FOLDER

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k