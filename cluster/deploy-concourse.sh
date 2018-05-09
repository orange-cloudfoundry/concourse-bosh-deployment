set -x
bosh -e ${BOSH_ENVIRONMENT} deploy -d concourse concourse.yml \
   -o operations/basic-auth.yml \
   -o operations/static-web.yml \
   -o operations/tls.yml \
   -o operations/tls-vars.yml \
   -o operations/listen-on-vip.yml \
   -o operations/privileged-https.yml \
   -l ../versions.yml \
   -v network_name=concourse-bucc \
   -v external_url=https://84.39.34.251 \
   -v external_ip=84.39.34.251 \
   -v web_ip=192.168.80.201 \
   --var web_vm_type=large \
   --var db_vm_type=large \
   --var db_persistent_disk_type=db \
   --var worker_vm_type=worker \
   -v deployment_name=concourse
