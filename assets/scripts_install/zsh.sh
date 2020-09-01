#!/bin/bash
# Escrips is for zsh instalations
sudo apt-get update -y
wait
sudo apt-get install -y zsh
wait
git clone https://github.com/ohmyzsh/ohmyzsh.git
wait
chmod u+x "$PWD"/oh-my-zsh/tools/install.sh;
clear
