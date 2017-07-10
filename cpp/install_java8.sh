#! /usr/bin/env bash

set -euo pipefail

main() {
    local readonly JAVA_VERSION=131
    local readonly JAVA_B=11
    local readonly JAVA_HASH="d54c1d3a095b4ff2b6607d096fa80163"

    # JDK (http://stackoverflow.com/a/10959815/3187068).
    wget \
        --no-check-certificate \
        --no-cookies \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        "http://download.oracle.com/otn-pub/java/jdk/8u${JAVA_VERSION}-b${JAVA_B}/${JAVA_HASH}/jdk-8u${JAVA_VERSION}-linux-x64.tar.gz"
    tar -xzvf jdk-8u${JAVA_VERSION}-linux-x64.tar.gz
    echo 'export JAVA_HOME="$HOME/jdk1.8.0_'${JAVA_VERSION}'"' >> ~/.bash_path
    echo 'export PATH="$JAVA_HOME/bin:$PATH"'                  >> ~/.bash_path
}

main
