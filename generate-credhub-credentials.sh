#!/usr/bin/env bash
#
# Description: Generate PCF credentials with Credhub
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

# AWS credentials
credhub set -n /concourse/pcf-$1/aws_access_key_id -t value -v CHANGEME
credhub set -n /concourse/pcf-$1/aws_secret_access_key -t value -v CHANGEME
credhub set -n /concourse/pcf-$1/pcf-$1-pem -t rsa -p CHANGEME # AWS EC2 keypair, include path to .pem file, e.g. ~/my-aws-ec2-keypair.pem

# Pivotal Network credentials
credhub set -n /concourse/pcf-$1/pivnet_token -t value -v CHANGEME

# GitHub credentials
credhub set -n /concourse/pcf-$1/git_private_key -t rsa -p CHANGEME # GitHub.com private key, typically a service account with access to pcf-pipelines, e.g. ~/.ssh/id_rsa

# PCF credential generation
credhub generate -n /concourse/pcf-$1/install-pcf/credhub_encryption_key_secret1 -t password
credhub generate -n /concourse/pcf-$1/install-pcf/credhub_encryption_key_secret2 -t password
credhub generate -n /concourse/pcf-$1/install-pcf/credhub_encryption_key_secret3 -t password
credhub generate -n /concourse/pcf-$1/install-pcf/db_accountdb_password -t password
credhub generate -n /concourse/pcf-$1/install-pcf/db_app_usage_service_password -t password
credhub generate -n /concourse/pcf-$1/install-pcf/db_autoscale_password -t password
credhub generate -n /concourse/pcf-$1/install-pcf/db_ccdb_password -t password
credhub generate -n /concourse/pcf-$1/install-pcf/db_diego_password -t password
credhub generate -n /concourse/pcf-$1/install-pcf/db_locket_password -t password
credhub generate -n /concourse/pcf-$1/install-pcf/db_networkpolicyserverdb_password -t password
credhub generate -n /concourse/pcf-$1/install-pcf/db_nfsvolumedb_password -t password
credhub generate -n /concourse/pcf-$1/install-pcf/db_notifications_password -t password
credhub generate -n /concourse/pcf-$1/install-pcf/db_routing_password -t password
credhub generate -n /concourse/pcf-$1/install-pcf/db_silk_password -t password
credhub generate -n /concourse/pcf-$1/install-pcf/db_uaa_password -t password
credhub generate -n /concourse/pcf-$1/install-pcf/db_master_password -t password
credhub generate -n /concourse/pcf-$1/opsman_admin_password -t password

