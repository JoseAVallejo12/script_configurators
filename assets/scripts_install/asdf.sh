#!/usr/bin/env bash
# Manage multiple runtime versions with a single CLI tool
sudo apt-get update
sudo apt install -y curl git
wait

# *******Install dependencias tested in ubuntu 18.04******
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0-rc1
wait
sudo apt-get install -y libssl-dev
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libsqlite3-dev
sudo apt-get install -y libssl1.0

# ******* Config shell ************
if [ "$SHELL" == "zsh" ]
then
	echo ". $HOME/.asdf/asdf.sh" >> ~/.zshrc
	echo "fpath=(${ASDF_DIR}/completions $fpath)" >> ~/.zshrc
	echo "autoload -Uz compinit" >> ~/.zshrc
	echo "compinit" >> ~/.zshrc
fi

if [ "$SHELL" == "bash" ]
then
	echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
	echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc
fi

asdf update

# ***** Add plugin python and nodejs ******
asdf plugin add python
wait
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
wait
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
