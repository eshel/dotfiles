#!/bin/sh
# Installation script for creating the symbolic links from the repository (under ~/.bash/.bash*) to the expected locations of the bash files (~/.bash*)


echo "Installing Homebrew first"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Updating Brew"
brew update
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew update
brew install --cask font-hack-nerd-font
brew install git bash-completion zsh-syntax-highlighting tree


echo "Install oh my zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

echo "Fetching oh-my-zsh and plugins"

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh


echo "Overriding dotfiles"

rm -f ~/.zshrc ~/.gitconfig ~/.gitignore_global ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/.vimrc ~/.vimrc

#echo "Make sure you have these packages installed: ack-grep"

echo "Installing vim stuff"

mkdir -p  ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh

source ~/.zshrc

echo "done"
