#!/usr/bin/env bash
#
# Description: Generate Prometheus credentials with Credhub
# Written by: Ryan Meharg - ryan.meharg@altoros.com
#
# -e          - fail on errors
# -u          - ensure all variables are set
# -o pipeline - catch pipeed command failures
# -x          - verbose when `export DEBUG=true` is set on shell

set -eu
set -o pipefail
[[ -z "${DEBUG:-""}" ]] || set -x

# Check that environment has been specificed
[[ $# -lt 1 ]] && (
    echo -e "Usage: ./generate-prometheus-credhub-credentials.sh aws-prod|aws-dev"
    exit 1
)


# PCF credential generation
credhub generate -n /concourse/pcf-$1/install-prometheus/uaa_firehose_exporter -t password
credhub generate -n /concourse/pcf-$1/install-prometheus/uaa_cf_exporter -t password
credhub generate -n /concourse/pcf-$1/install-prometheus/uaa_bosh_exporter -t password
credhub generate -n /concourse/pcf-$1/install-prometheus/grafana_admin_password -t password
credhub generate -n /concourse/pcf-$1/install-prometheus/prometheus_admin_password -t password
credhub generate -n /concourse/pcf-$1/install-prometheus/alertmanager_password -t password

credhub set -n /concourse/pcf-$1/install-prometheus/github_token -t value -v CHANGEME
