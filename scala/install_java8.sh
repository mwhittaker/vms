#! /usr/bin/env bash

set -euo pipefail

main() {
    readonly JAVA_VERSION=131
    readonly JAVA_B=11
    readonly JAVA_HASH="d54c1d3a095b4ff2b6607d096fa80163"

    # JDK (http://stackoverflow.com/a/10959815/3187068).
    wget \
        --no-check-certificate \
        --no-cookies \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        "http://download.oracle.com/otn-pub/java/jdk/8u${JAVA_VERSION}-b${JAVA_B}/${JAVA_HASH}/jdk-8u${JAVA_VERSION}-linux-x64.tar.gz"
    tar -xzvf jdk-8u${JAVA_VERSION}-linux-x64.tar.gz
    echo 'export JAVA_HOME="$HOME/jdk1.8.0_'${JAVA_VERSION}'"' >> ~/.bash_path
    echo 'export PATH="$JAVA_HOME/bin:$PATH"'                  >> ~/.bash_path

    # eclipse.
    readonly ECLIPSE_TAR="eclipse-java-oxygen-1-linux-gtk-x86_64.tar.gz"
    wget "http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/oxygen/1/${ECLIPSE_TAR}"
    tar -xzvf "${ECLIPSE_TAR}"
    echo 'export ECLIPSE_HOME="$HOME/eclipse"' >> ~/.bash_path
    echo 'export PATH="$ECLIPSE_HOME:$PATH"'   >> ~/.bash_path
}

main
