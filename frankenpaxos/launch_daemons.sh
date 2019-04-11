#! /usr/bin/env bash

set -euo pipefail

main() {
    trun -s daemons -d './scalafmt_ng' 'eclimd'
    trun -s daemons \
        'jupyter notebook --no-browser --ip 0.0.0.0 --port 8000' \
        'python -m http.server 8001' \
        'source activate flamescope && python run.py' \
        '# prometheus --config.file=prometheus.yml --storage.tsdb.path=prometheus_data --web.listen-address=0.0.0.0:8003' \
        'GF_SERVER_HTTP_PORT=8004 GF_PATHS_PROVISIONING=~/frankenpaxos/grafana ./bin/grafana-server web'
}

main "$@"
