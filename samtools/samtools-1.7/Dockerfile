# -*- default-generic -*-

FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV BUILD_PACKAGES build-essential
ENV RUN_PACKAGES libcurl4-gnutls-dev zlib1g-dev libncurses5-dev \
    libbz2-dev liblzma-dev  libssl-dev

# Install required packages
RUN rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get update && \
    apt-get install --yes ${BUILD_PACKAGES} ${RUN_PACKAGES} && \
    : done

# Unpack and build
ENV PACKAGE samtools
ENV VERSION 1.7
ADD ${PACKAGE}-${VERSION}.tar.bz2 /tmp/
WORKDIR /tmp/${PACKAGE}-${VERSION}

RUN ./configure --prefix=/usr/local && make && make install

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
CMD find /usr/local -type f | sort
