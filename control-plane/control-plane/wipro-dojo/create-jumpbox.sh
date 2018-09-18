#!/bin/sh
bosh create-env \
  ${BBL_STATE_DIR}/jumpbox-deployment/jumpbox.yml \
  --state  ${BBL_STATE_DIR}/vars/jumpbox-state.json \
  --vars-store  ${BBL_STATE_DIR}/vars/jumpbox-vars-store.yml \
  --vars-file  ${BBL_STATE_DIR}/vars/jumpbox-vars-file.yml \
  -o  ${BBL_STATE_DIR}/jumpbox-deployment/aws/cpi.yml \
  -v  access_key_id="${BBL_AWS_ACCESS_KEY_ID}" \
  -v  secret_access_key="${BBL_AWS_SECRET_ACCESS_KEY}" 
