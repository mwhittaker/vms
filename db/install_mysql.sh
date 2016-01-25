#! /bin/bash

set -euo pipefail

# MySQL Installation.
# http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/
wget 'http://dev.mysql.com/get/mysql-apt-config_0.6.0-1_all.deb'
sudo dpkg -i mysql-apt-config_0.6.0-1_all.deb
sudo apt-get update
sudo apt-get install -y mysql-server

# MySQL Setup.
sudo mysql -u root -e "create user 'vagrant'@'localhost';"
sudo mysql -u root -e "grant all privileges on *.* to 'vagrant'@'localhost';"

# mycli Installation
sudo pip install mycli
