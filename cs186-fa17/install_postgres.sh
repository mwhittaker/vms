#! /usr/bin/env bash

set -euo pipefail

main() {
    # Most of the postgres installation is done in root_setup.sh. Here, we
    # simply create a vagrant database so that running psql works by default.
    # Without this, running psql gives the error `FATAL: database "vagrant"
    # does not exist`.
    createdb vagrant
}

main
