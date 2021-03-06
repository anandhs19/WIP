#!/usr/bin/env bash
#
# Description: Set upgrade-ops-manager pipeline in Concourse and apply operations
# Written by: Amlan Datta - adatta@pivotal.io
#
# -e          - fail on errors
# -u          - ensure all variables are set
# -o pipeline - catch pipeed command failures
# -x          - verbose when `export DEBUG=true` is set on shell

set -eu
set -o pipefail
[[ -z "${DEBUG:-""}" ]] || set -x

[[ $# -lt 1 ]] && (
    echo -e "Usage: ./fly-upgrade-tile.sh prod|dev pas|mysql|healthwatch"
    exit 1
)

[[ $# -lt 2 ]] && (
    echo -e "Usage: ./fly-upgrade-tile.sh prod|dev pas|mysql|healthwatch"
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
fly -t concourse-$1 set-pipeline -n -p upgrade-tile-$2 \
  -c <(cat vendor/pcf-pipelines/upgrade-tile/pipeline.yml | \
  yaml-patch -o pipelines/upgrade-ops-manager/operations/set-pipeline-version.yml) \
  -l pipelines/upgrade-tile/params-$1-$2.yml
