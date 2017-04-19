#! /bin/bash

set -euo pipefail

# Postgres Installation.
# http://www.postgresql.org/download/linux/ubuntu/
sudo bash -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
    sudo apt-key add -
sudo apt-get update

sudo apt-get install -y postgresql-9.6 postgresql-server-dev-9.6 python-dev

# Postgres Setup.
#
# By default, a fresh postgres installation has a single role: postgres. In
# order to access the database as the vagrant user, we have to create a role as
# postgres for vagrant. Then we create a database named vagrant as vagrant.
#
# http://www.postgresql.org/docs/current/interactive/database-roles.html
sudo su postgres -c 'createuser vagrant -s'
createdb vagrant

# pgcli Installation
sudo pip install pgcli
