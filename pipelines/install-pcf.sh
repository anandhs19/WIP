fly -t concourse-prod set-pipeline -p install-pcf \
           -c <(cat ~/pcf-dojo/vendors/pcf-pipelines/install-pcf/aws/pipeline.yml | \
           yaml-patch -o opsfiles/pipeline-version.yml) \
           -l opsfiles/params-prod.yml
