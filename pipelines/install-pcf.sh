
fly -t concourse-prod set-pipeline -p install-pcf-prod \
	-c ~/pcf-dojo/vendors/pcf-pipelines/install-pcf/aws/pipeline.yml \
        -l opsfiles/params-prod.yml
