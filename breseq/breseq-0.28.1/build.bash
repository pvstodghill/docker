#! /bin/bash

PACKAGE=`egrep '^ENV +PACKAGE +' Dockerfile | sed -r -e 's/ENV +PACKAGE +//'`
VERSION=`egrep '^ENV +VERSION +' Dockerfile | sed -r -e 's/ENV +VERSION +//'`
IMAGE=pvstodghill/$PACKAGE
RELEASE=`date +%Y-%m-%d`

fulltag=${IMAGE}:${VERSION}__${RELEASE}

set -e
set -x

docker build --pull -t ${fulltag} .
docker run ${fulltag} breseq --version
docker push ${fulltag}
