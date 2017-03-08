# -*- default-generic -*-

FROM ubuntu:14.04

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE velvet
ENV VERSION 1.2.10
ENV BUILD_PACKAGES build-essential
ENV RUN_PACKAGES libgomp1

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${BUILD_PACKAGES} ${RUN_PACKAGES}


# Unpack and build
ADD ${PACKAGE}_${VERSION}.tgz /tmp/
WORKDIR /tmp/${PACKAGE}_${VERSION}

ENV PREFIX /usr/local
ENV MAXKMERLENGTH 150

RUN \
    make clean \
    && make OPENMP=1 BUNDLEDZLIB=1 MAXKMERLENGTH=${MAXKMERLENGTH} \
    && cp --archive velvetg ${PREFIX}/bin/velvetg \
    && cp --archive velveth ${PREFIX}/bin/velveth \
    && mkdir -p ${PREFIX}/share/velvet \
    && cp --archive contrib ${PREFIX}/share/velvet \
    && mkdir -p ${PREFIX}/share/doc/velvet \
    && cp --archive Manual.pdf Columbus_manual.pdf CREDITS.txt ChangeLog \
       README.txt ${PREFIX}/share/doc/velvet \
    && true

# Remove the build environment
WORKDIR /root
RUN rm -rf /tmp/${PACKAGE}-${VERSION} \
    && apt-get remove --yes --purge ${BUILD_PACKAGES} \
    && apt-get autoremove -y && apt-get clean

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
WORKDIR /mnt

# Default command - list the installed files
CMD find ${PREFIX} -type f | sort
