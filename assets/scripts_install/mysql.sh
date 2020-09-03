#!/bin/bash
# isntall mysql data base
sudo apt-get update -y
wait
sudo apt-get install -y mysql-server;


#******* for install version 5.7.x
# echo 'deb http://repo.mysql.com/apt/ubuntu/ trusty mysql-5.7-dmr' | sudo tee -a /etc/apt/sources.list
#sudo apt-get update
#sudo apt-get install mysql-server-5.7
#wait
#mysql --version
