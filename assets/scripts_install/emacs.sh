#!/bin/bash
echo "this escrips is for emacs instalations"
install_sudo;
wait;
sudo apt-get update -y;
sudo apt-get install -y emacs;
wait;
sh "$PWD"/assets/scripts_config/emacs.sh;
# Se debe incluir python3 modulo Elpy:
#This is the Emacs Python Development Environment. It aims to provide an easy to install, fully-featured environment for Python development. Contents.
