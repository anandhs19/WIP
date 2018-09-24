#!/usr/bin/env bash
#
# Description: Set pcf-prometheus pipeline in Concourse and apply operations
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
    echo -e "Usage: ./fly-pcf-prometheus.sh prod|dev"
    exit 1
)

# Check fly is installed
if [ -z "$(which fly)" ]; then
    echo "ERROR: fly CLI is missing"
    echo "Please download fly from:"
    echo "https://github.com/concourse/fly/releases"
    exit 1
fi

# Set pipeline non-interactively with config file and load env parameters
fly -t concourse-$1 set-pipeline -n -p pcf-prometheus \
  -c vendor/pcf-prometheus-pipeline/pipeline/pipeline.yml \
  -c <(cat vendor/pcf-prometheus-pipeline/pipeline/pipeline.yml | \
  yaml-patch -o pipelines/pcf-prometheus/operations/target-opsman-director.yml) \
  -l pipelines/pcf-prometheus/params-$1.yml
