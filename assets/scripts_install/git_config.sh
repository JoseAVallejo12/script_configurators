#!/bin/bash
echo "this escrips is for git_config instalations"
install_sudo;
wait;
echo "";
echo -e "*Please write your github ${GREEN}USER NAME${NC} account:";
read -r GIT_USER;
echo "";
echo -e "*Please write your github ${GREEN}PASSWORD${NC} account:";
read -r GIT_PASSW;
echo "";
echo -e "*Please write your github ${GREEN}EMAIL${NC} account:";
read -r GIT_EMAIL;
# ----------------------------------------------------------------
echo "[user]" > "$HOME"/.gitconfig
echo "     name = $GIT_USER" >> "$HOME"/.gitconfig
echo "     email = $GIT_EMAIL" >> "$HOME"/.gitconfig
echo "[push]" >> "$HOME"/.gitconfig
echo "     default = matching" >> "$HOME"/.gitconfig
echo "[credential]" >> "$HOME"/.gitconfig
echo "     helper = store" >> "$HOME"/.gitconfig
# ----------------------------------------------------------------
echo "https://$GIT_USER:$GIT_PASSW@github.com" >> "$HOME"/.git-credentials
return;

clear;
echo "**************************************";
echo "   Github Credentials installing...   ";
echo "**************************************";
