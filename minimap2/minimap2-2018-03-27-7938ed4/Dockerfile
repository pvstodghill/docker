# -*- default-generic -*-

FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE minimap2
ENV VERSION 7938ed4
ENV LONGVERSION 7938ed489333da0d67867b8cc9b82b2630e6fddf
ENV BUILD_PACKAGES build-essential zlib1g-dev unzip
ENV RUN_PACKAGES zlib1g

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${BUILD_PACKAGES} ${RUN_PACKAGES}

# Download and build
ADD ${PACKAGE}-${LONGVERSION}.zip /tmp/
RUN cd /tmp && \
    unzip ${PACKAGE}-${LONGVERSION}.zip && \
    cd ${PACKAGE}-${LONGVERSION} && \
    make && \
    cp --archive minimap2 /usr/local/bin/  && \
    mkdir -p /usr/local/share/man/man1 && \
    cp minimap2.1 /usr/local/share/man/man1/ && \
    mkdir -p /usr/local/share/doc/minimap2  && \
    cp --archive LICENSE.txt README.md /usr/local/share/doc/minimap2/

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
