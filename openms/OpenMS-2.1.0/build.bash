#! /bin/bash

PACKAGE=`egrep '^ENV +PACKAGE +' Dockerfile | sed -r -e 's/ENV +PACKAGE +//'`
VERSION=`egrep '^ENV +VERSION +' Dockerfile | sed -r -e 's/ENV +VERSION +//'`
IMAGE=pvstodghill/$PACKAGE
RELEASE=`date +%Y-%m-%d`

fulltag=`echo ${IMAGE}:${VERSION}__${RELEASE} | tr '[A-Z]' '[a-z]'`

set -e
set -x

docker build --pull -t ${fulltag} .
docker run --rm ${fulltag} ExecutePipeline --help
docker push ${fulltag}

