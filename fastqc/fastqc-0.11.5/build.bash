#! /bin/bash

PACKAGE=`egrep '^ENV +PACKAGE +' Dockerfile | sed -r -e 's/ENV +PACKAGE +//'`
VERSION=`egrep '^ENV +VERSION +' Dockerfile | sed -r -e 's/ENV +VERSION +//'`
IMAGE=pvstodghill/$PACKAGE
RELEASE=`date +%Y-%m-%d`

fulltag=${IMAGE}:${VERSION}__${RELEASE}

if [ "$1" = "-f" ] ; then
    opt_f=1
    shift
fi

set -e
set -x

rm -rf FastQC
unzip ${PACKAGE}_v${VERSION}.zip 
docker build $pull_arg -t ${fulltag} .
rm -rf FastQC
docker run ${fulltag}
if [ "$opt_f" ] ; then
    docker push ${fulltag}
fi
