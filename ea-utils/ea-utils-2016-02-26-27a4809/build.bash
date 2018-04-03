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

pull_arg=
if [ "$opt_f" ] ; then
    pull_arg=--pull
fi


set -e
set -x

docker build $pull_arg -t ${fulltag} .
docker run ${fulltag}
if [ "$opt_f" ] ; then
    docker push ${fulltag}
fi
