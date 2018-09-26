#!/usr/bin/env bash
#
# Description: Login to a Credhub
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
    echo -e "Usage: ./credhub.sh director|concourse"
    exit 1
)

# Check bbl is installed
if [ -z "$(which bbl)" ]; then
    echo "ERROR: BOSH Bootloader CLI is missing"
    echo "Please download bbl"
    exit 1
fi

# Check fly is installed
if [ -z "$(which fly)" ]; then
    echo "ERROR: fly CLI is missing"
    echo "Please download fly from:"
    echo "https://github.com/concourse/fly/releases"
    exit 1
fi

# Check credhub is installed
if [ -z "$(which credhub)" ]; then
    echo "ERROR: Credhub CLI is missing"
    echo "Please download credhub"
    exit 1
fi

pushd control-plane
  eval "$(bbl print-env)"

  if [[ "$1" == "director" ]]; then
    credhub login
  elif [[ "$1" == "concourse" ]]; then
    CONCOURSE_URL=https://concourse.pcf-aws.com
    . ../vendor/concourse-credhub/target-concourse-credhub.sh
  else
    echo "Invalid CredHub, must be director or concourse"
    exit 1
  fi
popd
