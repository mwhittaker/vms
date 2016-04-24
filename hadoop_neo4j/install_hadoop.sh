#! /bin/bash

set -euo pipefail

main() {
    # java
    sudo apt-get install -y openjdk-7-jre openjdk-7-jdk

    # hadoop
    HADOOP="hadoop-2.7.2"
    wget "http://apache.mesi.com.ar/hadoop/common/$HADOOP/$HADOOP.tar.gz"
    tar -xzf "$HADOOP.tar.gz"
    sudo mv "$HADOOP" /opt
    echo "" > ~/.bash_path
    echo 'export PATH="$PATH:/opt/'"$HADOOP"'/bin"' >> ~/.bash_path
    echo 'export JAVA_HOME="/usr/lib/jvm/java-1.7.0-openjdk-amd64"' >> ~/.bash_path
}

main
