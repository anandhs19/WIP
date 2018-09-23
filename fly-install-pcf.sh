#!/usr/bin/env bash
#
# Description: Set install-pcf pipeline in Concourse and apply operations
# Written by: Amlan Datta - adatta@pivotal.io
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
    echo -e "Usage: ./fly-install-pcf.sh prod|dev"
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
fly -t concourse-$1 set-pipeline -n -p install-pcf \
  -c <(cat vendor/pcf-pipelines/install-pcf/aws/pipeline.yml | \
  yaml-patch -o pipelines/install-pcf/operations/set-pipeline-version.yml) \
  -l pipelines/install-pcf/params-$1.yml
