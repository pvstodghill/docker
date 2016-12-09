#! /bin/bash

set -e
set -x

PACKAGE=`egrep '^ENV +PACKAGE +' Dockerfile | sed -r -e 's/ENV +PACKAGE +//'`
VERSION=`egrep '^ENV +VERSION +' Dockerfile | sed -r -e 's/ENV +VERSION +//'`
IMAGE=pvstodghill/$PACKAGE
RELEASE=`date +%Y-%m-%d`

fulltag=${IMAGE}:${VERSION}__${RELEASE}

rm -rf ${PACKAGE}-${VERSION}
unzip ${PACKAGE}-${VERSION}-linux-x86_64.zip 
docker build --pull -t ${fulltag} .
rm -rf ${PACKAGE}-${VERSION}
docker run ${fulltag}
if [ "$1" = "-f" ] ; then
    docker push ${fulltag}
fi
