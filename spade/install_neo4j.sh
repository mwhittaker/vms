#! /bin/bash

set -euo pipefail

main() {
    wget \
        -O 'neo4j-community-2.2.4-unix.tar.gz' \
        'https://neo4j.com/artifact.php?name=neo4j-community-2.2.4-unix.tar.gz'
    tar -xzvf neo4j-community-2.2.4-unix.tar.gz
    sed -i 's/#org.neo4j.server.webserver.address=0.0.0.0/org.neo4j.server.webserver.address=0.0.0.0/' neo4j-community-2.2.4/conf/neo4j-server.properties
}


main
