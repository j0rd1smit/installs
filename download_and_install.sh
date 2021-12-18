#!/bin/bash

STARTING_FOLDER="$(pwd)"

echo ""
echo "##################"
echo "# Installing zsh #"
echo "##################"
echo ""

if [[ "$(uname)" == "Linux" ]]; 
then {
	(command -v zsh > /dev/null;) || (sudo apt-get update && sudo apt-get install zsh)
};
elif [[ "$(uname)" == "Darwin" ]]
then {
	(command -v zsh > /dev/null;) || brew install zsh
}
fi

echo ""
echo "######################"
echo "# Setting up ohmyzsh #"
echo "######################"
echo ""

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
chsh -s /bin/zsh

sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo ""
echo "#######################"
echo "# Setting up dotfiles #"
echo "#######################"
echo ""

git clone https://github.com/j0rd1smit/dotfiles.git ~/.dotfiles
~/.dotfiles/install

echo ""
echo "#############################"
echo "# Setting up dotfiles-local #"
echo "#############################"
echo ""
git clone https://github.com/j0rd1smit/dotfiles-local.git ~/.dotfiles-local
cd ~/.dotfiles-local
git switch -c "$(hostname)"
~/.dotfiles-local/install
cd $STARTING_FOLDER


