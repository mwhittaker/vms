#! /usr/bin/env bash

set -euo pipefail

main() {
    # eclipse.
    readonly ECLIPSE_TAR="eclipse-java-oxygen-1-linux-gtk-x86_64.tar.gz"
    wget "http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/neon/3/${ECLIPSE_TAR}"
    tar -xzvf "${ECLIPSE_TAR}"
    echo 'export ECLIPSE_HOME="$HOME/eclipse"' >> ~/.bash_path
    echo 'export PATH="$ECLIPSE_HOME:$PATH"'   >> ~/.bash_path

    # eclim.
    readonly ECLIM_VERSION="2.7.0"
    wget "https://github.com/ervandew/eclim/releases/download/${ECLIM_VERSION}/eclim_${ECLIM_VERSION}.jar"
    java \
        -Dvim.files=/home/vagrant/.vim \
        -Declipse.home=/home/vagrant/eclipse \
        -jar "eclim_${ECLIM_VERSION}.jar" install

    # maven
    wget 'http://www-us.apache.org/dist/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.zip'
    unzip apache-maven-3.5.0-bin.zip
    echo 'export MAVEN_HOME="$HOME/apache-maven-3.5.0"' >> ~/.bash_path
    echo 'export PATH="$MAVEN_HOME/bin:$PATH"'          >> ~/.bash_path
}

main
