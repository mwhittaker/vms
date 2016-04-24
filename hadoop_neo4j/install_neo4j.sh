#! /bin/bash

set -euo pipefail

main() {
    neo="neo4j-2.3.3"
    wget 'http://neo4j.com/artifact.php?name=neo4j-community-2.3.3-unix.tar.gz' \
         -O "$neo.tar.gz"
    tar -xzvf "$neo.tar.gz"
    echo 'export PATH=$PATH:$HOME/neo4j-community-2.3.3/bin' >> ~/.bash_path
}

main
