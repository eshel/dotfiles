#!/bin/bash
# Installation script for creating the symbolic links from the repository (under ~/.bash/.bash*) to the expected locations of the bash files (~/.bash*)

ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global

echo "Make sure you have these packages installed: ack-grep"

echo "Installing vim stuff"

ln -s ~/dotfiles/.vimrc ~/.vimrc

mkdir ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ./.vim/bundle/Vundle.vim.git
vim +PluginInstall +qall

echo "done"

