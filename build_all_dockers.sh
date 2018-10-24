#!/usr/bin/env bash

for i in $(cat ansible_versions.txt)
do 
  export j=$(echo $i | awk -F . '{print $1}')
  docker build --build-arg VCS_REF=`git rev-parse --short HEAD` \
    --build-arg BUILD_DATE=`date -u +”%Y-%m-%dT%H:%M:%SZ”` \
    --build-arg ANSIBLE_VERSION=2.$i -t sdesbure/ansible:2.$i . 
  docker push sdesbure/ansible:2.$i
  docker tag sdesbure/ansible:2.$i sdesbure/ansible:2.$j
  docker push sdesbure/ansible:2.$j
done
