#!/usr/bin/env bash
# pyenv lets you easily switch between multiple versions of Python
# Tested in ubuntu 18.04 run in WSL2
sudo apt-get update
sudo apt install -y curl git
wait

# *******Install dependencias tested in ubuntu 18.04******
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
wait
sudo apt-get install -y libssl-dev
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libsqlite3-dev
sudo apt-get install -y libssl1.0

# ******* Config shell ************
if [ "$SHELL" == "zsh" ]
then
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
  echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
fi

if [ "$SHELL" == "bash" ]
then
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
  echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
fi
exec "$SHELL"
