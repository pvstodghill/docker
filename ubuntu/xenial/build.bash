#! /bin/bash

PACKAGE=`egrep '^ENV +PACKAGE +' Dockerfile | sed -r -e 's/ENV +PACKAGE +//'`
VERSION=`egrep '^ENV +VERSION +' Dockerfile | sed -r -e 's/ENV +VERSION +//'`
IMAGE=pvstodghill/$PACKAGE

fulltag=`echo ${IMAGE}:${VERSION} | tr '[A-Z]' '[a-z]'`

set -e
set -x

docker build --pull -t ${fulltag} .
docker run --rm ${fulltag} lsb_release -a
docker push ${fulltag}

