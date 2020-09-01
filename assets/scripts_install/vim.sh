#!/bin/bash
# This escrips is for vim instalations
sudo apt-get update -y
sudo apt-get install -y vim
wait
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
wait
sudo rm "$HOME/.vimrc"
sudo cp "assets/scripts_config/.vimrc" "$HOME/.vimrc"
sudo vim +PluginInstall +qall
