#!/bin/bash

if [ $# -ne 1 ];then
    echo "Usage: $0 k8s.gcr.io/Imagename"
    exit 177
fi

GCR_IMAGE_NAME=$1
GCR_IMAGE_TAG=$(curl -sSL https://k8s.gcr.io/v2/${GCR_IMAGE_NAME}/tags/list|jq .tags[])
GCR_TAG_ARRAY=($(echo "$GCR_IMAGE_TAG"|xargs))
CURRENT_TAG_ARRAY=($(git tag|xargs))

# clean git tag
for i in ${GCR_TAG_ARRAY[@]};do
        if [[ " ${CURRENT_TAG_ARRAY[@]} " =~ " ${i} " ]]; then
                git config --global user.name "kuops"
                git config --global user.email opshsy@gmail.com
                git tag --delete $i
                git push origin :$i
        fi
done
# add git tag
for i in ${GCR_TAG_ARRAY[@]};do
	if [[ ! " ${CURRENT_TAG_ARRAY[@]} " =~ " ${i} " ]]; then
		echo  "FROM ${GCR_IMAGE_NAME}:$i" > Dockerfile
		git config --global user.name "kuops"
		git config --global user.email opshsy@gmail.com
		git add -A
		git commit -m "$GCR_IMAGE_NAME version $i"
		git tag -a $i  -m "$GCR_IMAGE_NAME version $i"
	fi
	git push origin $i
done
