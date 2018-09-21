MY_ENV=$1

#if [ -z ${MY_ENV} -o ${MY_ENV} != "prod" -o ${MY_ENV} != "dev" ]
if [ -z ${MY_ENV} ] || [[ !(${MY_ENV} = "prod" || ${MY_ENV} = "dev") ]];then
	echo "USAGE: upgrade-ops-manager.sh prod|dev" 
	exit 1
fi
fly -t concourse-$MY_ENV set-pipeline -p upgrade-ops-manager \
           -c <(cat ~/pcf-dojo/vendors/pcf-pipelines/upgrade-ops-manager/aws/pipeline.yml | \
           yaml-patch -o ../opsfiles/pipeline-version.yml) \
          -l opsfiles/params-$MY_ENV.yml
