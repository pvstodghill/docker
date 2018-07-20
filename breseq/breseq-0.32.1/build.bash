#! /bin/bash

PACKAGE=`egrep '^ENV +PACKAGE +' Dockerfile | sed -r -e 's/ENV +PACKAGE +//'`
VERSION=`egrep '^ENV +VERSION +' Dockerfile | sed -r -e 's/ENV +VERSION +//'`
IMAGE=pvstodghill/$PACKAGE
RELEASE=`date +%Y-%m-%d`

BVERSION=`egrep '^ENV +BVERSION +' Dockerfile | sed -r -e 's/ENV +BVERSION +//'`

fulltag=${IMAGE}:${VERSION}__${RELEASE}

set -e
set -x

rm -rf bowtie2-${BVERSION}-linux-x86_64
unzip bowtie2-${BVERSION}-linux-x86_64.zip
docker build --pull -t ${fulltag} .
rm -rf bowtie2-${BVERSION}
docker run ${fulltag} breseq --version
docker push ${fulltag}
