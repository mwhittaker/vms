#! /bin/bash

# Resources:
#   - https://www.erlang-solutions.com/resources/download.html

main() {
    wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
    sudo dpkg -i erlang-solutions_1.0_all.deb
    sudo apt-get update
    sudo apt-get install -y erlang
}

main
