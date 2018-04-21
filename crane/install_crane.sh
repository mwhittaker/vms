#! /bin/bash

set -euo pipefail

boxed() {
    local -r msg="* $1 *"
    echo "$msg" | sed 's/./*/g'
    echo "$msg"
    echo "$msg" | sed 's/./*/g'
}

install_dependencies() {
    boxed "install_dependencies"
    sudo apt-get install -y \
        autoconf axel bison build-essential curl dejagnu flex git libboost-dev \
        libboost-system-dev libbz2-dev libconfig-dev libdb-dev libevent-dev \
        libsqlite3-dev libxml-libxml-perl libxml2-dev libxslt1-dev m4 mencoder \
        nano php5-cgi psmisc python-dev python-pip python-setuptools \
        subversion sysbench valgrind wget zlib1g-dev
    sudo pip install numpy OutputCheck
}

setup_bash_path() {
    boxed "setup_bash_path"
    export MSMR_ROOT="$HOME/crane"
    export XTERN_ROOT="$MSMR_ROOT/xtern"
    export LD_LIBRARY_PATH="$MSMR_ROOT/libevent_paxos/.local/lib:$LD_LIBRARY_PATH"

    if ! grep 'MSMR_ROOT' ~/.bash_path; then
        echo 'export MSMR_ROOT="$HOME/crane"' >> ~/.bash_path
    fi
    if ! grep 'XTERN_ROOT' ~/.bash_path; then
        echo 'export XTERN_ROOT="$MSMR_ROOT/xtern"' >> ~/.bash_path
    fi
    if ! grep 'libevent_paxos' ~/.bash_path; then
        echo 'export LD_LIBRARY_PATH="$MSMR_ROOT/libevent_paxos/.local/lib:$LD_LIBRARY_PATH"' >> ~/.bash_path
    fi
}

clone_repo() {
    boxed "clone_repo"
    if ! [[ -d "$HOME/crane" ]]; then
        cd "$HOME"
        git clone https://github.com/columbia/crane
    fi
}

compile_xtern() {
    boxed "compile_xtern"
    cd $HOME/crane/xtern
    mkdir -p obj
    cd obj
    ../configure --prefix=$XTERN_ROOT/install
    make clean
    make
    make install
}

install_dynamorio() {
    boxed "install_dynamorio"
    sudo apt-get install -y \
        cmake doxygen ghostscript imagemagick subversion transfig
    cd /usr/share/
    if ! [[ -d dynamorio ]]; then
        sudo git clone https://github.com/DynamoRIO/dynamorio.git
    fi
    cd dynamorio
    sudo mkdir -p build
    cd build
    sudo cmake ..
    sudo make
    sudo make drcov
    cd tools
    # sudo ln -s $PWD/../drcov.drrun64 .
    sudo mkdir -p lib64
    cd lib64
    sudo mkdir -p release
    cd release
    sudo ln -sf $PWD/../../../clients/lib64/release/libdrcov.so .
}

install_lxc() {
    boxed "install_lxc"
    sudo add-apt-repository -y ppa:ubuntu-lxc/daily
    sudo apt-get update -y
    sudo apt-get install -y lxc
    lxc-create --version
}

launch_lxc() {
    boxed "launch_lxc"
    if sudo lxc-ls | grep u1; then
        if sudo lxc-ls --fancy | grep RUNNING; then
            sudo lxc-stop -n u1
        fi
        sudo lxc-destroy -n u1
    fi
    sudo lxc-create -t ubuntu -n u1 -- -r trusty -a amd64
    sudo lxc-start -n u1 -d
    # echo "/run/shm run/shm none bind,create=dir" | sudo tee /var/lib/lxc/u1/fstab
    if ! sudo grep crane /var/lib/lxc/u1/config; then
        echo ''                                               | sudo tee --append /var/lib/lxc/u1/config
        echo '# for crane project.'                           | sudo tee --append /var/lib/lxc/u1/config
        echo 'lxc.mount.entry = /run/shm srv/shm none bind,create=dir' | sudo tee --append /var/lib/lxc/u1/config
        echo 'lxc.network.ipv4 = 10.0.3.111/16'               | sudo tee --append /var/lib/lxc/u1/config
        # echo 'lxc.console = none'                             | sudo tee --append /var/lib/lxc/u1/config
        # echo 'lxc.tty = 0'                                    | sudo tee --append /var/lib/lxc/u1/config
        echo 'lxc.cgroup.devices.deny = c 5:1 rwm'            | sudo tee --append /var/lib/lxc/u1/config
        # echo 'lxc.mount.auto = proc:rw sys:rw cgroup-full:rw' | sudo tee --append /var/lib/lxc/u1/config
        echo 'lxc.aa_profile = unconfined'                    | sudo tee --append /var/lib/lxc/u1/config
    fi
    ssh-keygen -f "/home/vagrant/.ssh/known_hosts" -R 10.0.3.111
    sudo lxc-stop -n u1
    sudo lxc-start -n u1 -d

    # sudo lxc-attach -n u1 -- 'echo "ubuntu ALL = NOPASSWD: ALL" >> /etc/sudoers'
    sudo lxc-attach -n u1 -- rm -rf /dev/shm
    sudo lxc-attach -n u1 -- ln -s /srv/shm /dev/shm
    sudo cp /vagrant/install_in_lxc.sh /var/lib/lxc/u1/rootfs/home/ubuntu
    sudo lxc-attach -n u1 -- su ubuntu -c 'cd $HOME && bash install_in_lxc.sh'
}

main() {
    # install_dependencies
    # setup_bash_path
    # clone_repo
    # compile_xtern
    # install_dynamorio
    # install_lxc
    launch_lxc
}

main
