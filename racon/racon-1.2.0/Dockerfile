# -*- default-generic -*-

FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV BUILD_PACKAGES build-essential cmake
ENV RUN_PACKAGES ""

# Install required packages
RUN rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get update && \
    apt-get install --yes ${BUILD_PACKAGES} ${RUN_PACKAGES} && \
    : done

# Unpack and build
ENV PACKAGE racon
ENV VERSION 1.2.0
ADD ${PACKAGE}-v${VERSION}.tar.gz /tmp/
WORKDIR /tmp/${PACKAGE}-v${VERSION}

RUN \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make && make install && \
    mkdir -p /usr/local/share/doc/racon  && \
    cd .. && cp --archive LICENSE README.md /usr/local/share/doc/racon/

# Remove the build environment
WORKDIR /root
RUN rm -rf /tmp/${PACKAGE}-v${VERSION} \
    && apt-get remove --yes --purge ${BUILD_PACKAGES} \
    && apt-get autoremove -y && apt-get clean

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
WORKDIR /mnt

# Default command - list the installed files
CMD find /usr/local -type f | sort
