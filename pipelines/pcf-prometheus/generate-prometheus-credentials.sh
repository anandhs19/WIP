#!/usr/bin/env bash
#
# Description: Generate PCF prometheus credentials with Credhub
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
    echo -e "Usage: ./generate-credhub-credentials.sh <MY_ENV>"
    exit 1
)

# Check fly is installed
if [ -z "$(which credhub)" ]; then
    echo "ERROR: Credhub CLI is missing"
    echo "Please download credhub from:"
    echo "https://github.com/cloudfoundry-incubator/credhub-cli/releases"
    exit 1
fi

# GitHub.com token to avoid API rate limits
# You can generate one at https://github.com/settings/tokens
credhub set -n /concourse/pcf-$1/github_token -t value -v CHANGEME

# PCF Prometheus credential generation
credhub generate -n /concourse/pcf-$1/pcf-prometheus/uaa_firehose_exporter -t password
credhub generate -n /concourse/pcf-$1/pcf-prometheus/uaa_cf_exporter -t password
credhub generate -n /concourse/pcf-$1/pcf-prometheus/uaa_bosh_exporter -t password
credhub generate -n /concourse/pcf-$1/pcf-prometheus/grafana_admin_password -t password
credhub generate -n /concourse/pcf-$1/pcf-prometheus/prometheus_admin_password -t password
credhub generate -n /concourse/pcf-$1/pcf-prometheus/alertmanager_password -t password

