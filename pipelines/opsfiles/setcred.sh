
MY_ENV=$1

credhub set -n /concourse/pcf-$MY_ENV/aws_access_key_id -t value -v CHANGEME
credhub set -n /concourse/pcf-$MY_ENV/aws_secret_access_key -t value -v CHANGEME
credhub set -n /concourse/pcf-$MY_ENV/pivnet_token -t value -v CHANGEME

credhub generate -n /concourse/pcf-$MY_ENV/install-pcf/credhub_encryption_key_secret1 -t password
credhub generate -n /concourse/pcf-$MY_ENV/install-pcf/db_accountdb_password -t password
credhub generate -n /concourse/pcf-$MY_ENV/install-pcf/db_app_usage_service_password -t password
credhub generate -n /concourse/pcf-$MY_ENV/install-pcf/db_autoscale_password -t password
credhub generate -n /concourse/pcf-$MY_ENV/install-pcf/db_ccdb_password -t password
credhub generate -n /concourse/pcf-$MY_ENV/install-pcf/db_diego_password -t password
credhub generate -n /concourse/pcf-$MY_ENV/install-pcf/db_locket_password -t password
credhub generate -n /concourse/pcf-$MY_ENV/install-pcf/db_networkpolicyserverdb_password -t password
credhub generate -n /concourse/pcf-$MY_ENV/install-pcf/db_nfsvolumedb_password -t password
credhub generate -n /concourse/pcf-$MY_ENV/install-pcf/db_notifications_password -t password
credhub generate -n /concourse/pcf-$MY_ENV/install-pcf/db_routing_password -t password
credhub generate -n /concourse/pcf-$MY_ENV/install-pcf/db_silk_password -t password
credhub generate -n /concourse/pcf-$MY_ENV/install-pcf/db_uaa_password -t password
credhub generate -n /concourse/pcf-$MY_ENV/install-pcf/db_master_password -t password

credhub generate -n /concourse/pcf-$MY_ENV/opsman_admin_password -t password

credhub set -n /concourse/pcf-$MY_ENV/pcf-$MY_ENV-pem -t rsa -p CHANGEME #include path of pem
credhub set -n /concourse/pcf-$MY_ENV/git_private_key -t rsa -p CHANGEME #e.g Private key ~/.ssh/id_rsa
