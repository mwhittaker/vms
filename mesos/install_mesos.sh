#! /bin/bash

set -euo pipefail

# Resources:
#   - http://mesos.apache.org/gettingstarted/

main() {
    # Update the packages.
    sudo apt-get update
    # Install a few utility tools.
    sudo apt-get install -y tar wget git
    # Install the latest OpenJDK.
    sudo apt-get install -y openjdk-7-jdk
    # Install autotools (Only necessary if building from git repository).
    sudo apt-get install -y autoconf libtool
    # Install other Mesos dependencies.
    sudo apt-get -y install build-essential python-dev libcurl4-nss-dev \
                            libsasl2-dev libsasl2-modules maven libapr1-dev \
                            libsvn-dev

    # Download mesos.
    wget http://archive.apache.org/dist/mesos/1.0.1/mesos-1.0.1.tar.gz
    tar -zxf mesos-1.0.1.tar.gz

    # Build mesos.
    cd mesos-1.0.1
    ./bootstrap
    mkdir build
    cd build
    ../configure
    make
    make check
}

main
