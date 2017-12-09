#! /usr/bin/env bash

set -euo pipefail

main() {
    # eclim.
    readonly JAVA_VERSION=131
    readonly ECLIM_VERSION="2.7.0"
    wget "https://github.com/ervandew/eclim/releases/download/${ECLIM_VERSION}/eclim_${ECLIM_VERSION}.jar"
    JAVA_HOME="${HOME}/jdk1.8.0_${JAVA_VERSION}" \
    PATH="${JAVA_HOME}/bin:${PATH}" \
    jdk1.8.0_${JAVA_VERSION}/bin/java \
        -Dvim.files=/home/vagrant/.vim \
        -Declipse.home=/home/vagrant/eclipse \
        -jar "eclim_${ECLIM_VERSION}.jar" install
}

main
