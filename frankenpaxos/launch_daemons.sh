#! /usr/bin/env bash

# Get the `trun` command.
source ~/.bash_functions

set -euo pipefail

main() {
    trun -s daemons -d './scalafmt_ng' 'eclimd'
    trun -s daemons \
        'jupyter notebook --no-browser --ip 0.0.0.0 --port 8000' \
        'python -m http.server 8001' \
        'cd flamescope && source activate flamescope && python run.py' \
        'cd prometheus-* # prometheus --config.file=prometheus.yml --storage.tsdb.path=prometheus_data --web.listen-address=0.0.0.0:8003' \
        'cd grafana-* && GF_SERVER_HTTP_PORT=8004 GF_PATHS_PROVISIONING=~/frankenpaxos/grafana ./bin/grafana-server web'
}

main "$@"
