#! /usr/bin/env bash

set -euo pipefail

main() {
    # Update and upgrade packages.
    apt-get update
    apt-get upgrade -y

    # Set the timezone.
    timedatectl set-timezone America/Los_Angeles

    # Install basic packages. Note that we have to run the fix_db.pl command to
    # avoid errors installing dictoionaries-common. See [1] for more details.
    #
    # [1]: https://stackoverflow.com/a/23678422/3187068
    apt-get install -y dictionaries-common || true
    /usr/share/debconf/fix_db.pl
    apt-get install -y chromium-browser emacs git tmux vim xfce4 xfce4-terminal

    # Install java and eclipse dependencies.
    apt-get install -y libswt-gtk-3-java unzip

    # Install postgres [1].
    #
    # [1]: http://www.postgresql.org/download/linux/ubuntu/
    bash -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
        apt-key add -
    apt-get update
    apt-get install -y postgresql-9.6 postgresql-server-dev-9.6 python-dev

    # By default, a fresh postgres installation has a single role: postgres. In
    # order to access the database as the vagrant user, we have to create a role as
    # postgres for vagrant. Then we create a database named vagrant as vagrant.
    #
    # http://www.postgresql.org/docs/current/interactive/database-roles.html
    su postgres -c 'createuser vagrant -s'
}

main
