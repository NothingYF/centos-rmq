#!/bin/sh

REPO=nothingdocker
IMAGE_NAME=`basename $PWD`
DOCKER_NAME=${1:-demo}
docker rm -f $DOCKER_NAME
docker run -d --privileged \
	--name $DOCKER_NAME \
	-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
	-v /data/mongo/db:/var/lib/mongo \
	-v /data/mongo/logs:/var/log/mongodb \
	-p 127.0.0.1:23000:3000 \
	$REPO/$IMAGE_NAME
docker exec -it $DOCKER_NAME bash
