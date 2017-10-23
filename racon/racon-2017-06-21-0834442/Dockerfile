# -*- default-generic -*-

FROM ubuntu:xenial

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV GITUSER isovic
ENV PACKAGE racon
ENV VERSION 0834442
ENV BUILD_PACKAGES git build-essential zlib1g-dev
ENV RUN_PACKAGES zlib1g mummer python-numpy python-matplotlib libgomp1

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${BUILD_PACKAGES} ${RUN_PACKAGES}

# Download and build
RUN set -x && cd /tmp && \
    git clone https://github.com/${GITUSER}/${PACKAGE}.git && \
    cd ${PACKAGE} && \
    git checkout ${VERSION} && \
    make modules && make tools && make && \
    cp --archive bin/racon /usr/local/bin/  && \
    mkdir -p /usr/local/lib/racon && \
    cp --archive tools /usr/local/lib/racon/ && \
    mkdir -p /usr/local/share/doc/racon  && \
    cp --archive LICENSE README.md scripts /usr/local/share/doc/racon/


# Remove the build environment
WORKDIR /root
RUN rm -rf /tmp/${PACKAGE} \
    && apt-get remove --yes --purge ${BUILD_PACKAGES} \
    && apt-get autoremove -y && apt-get clean

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
WORKDIR /mnt

# Default command - list the installed files
CMD find /usr/local -type f | sort
