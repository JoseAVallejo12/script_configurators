#!/bin/bash
set -x
echo "this escrips is for betty instalations"
sudo apt-get update -y;
wait;
git clone https://github.com/holbertonschool/Betty.git
wait;
echo '*******************************************';
echo 'preparing for installation proccess. wait !';
echo '*******************************************';
sleep 2;
cd "$PWD"/Betty
source ./install.sh;
sudo -y cp assets/scripts_config/betty /bin/;
cd ..
rm -rf "$PWD"/Betty;
