# -*- default-generic -*-

FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE miniasm
ENV VERSION 9415d29
ENV LONGVERSION 9415d299f0b24bffd5ee1422d3e9399f115c2561
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
    cp --archive miniasm /usr/local/bin/  && \
    mkdir -p /usr/local/share/man/man1 && \
    cp miniasm.1 /usr/local/share/man/man1/ && \
    mkdir -p /usr/local/share/doc/miniasm  && \
    cp --archive LICENSE.txt README.md /usr/local/share/doc/miniasm/

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
