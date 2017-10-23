# -*- default-generic -*-

FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE minimap
ENV VERSION fdf32ad
ENV BUILD_PACKAGES git build-essential zlib1g-dev
ENV RUN_PACKAGES zlib1g

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${BUILD_PACKAGES} ${RUN_PACKAGES}

# Download and build
RUN cd /tmp && \
    git clone https://github.com/lh3/${PACKAGE}.git && \
    cd ${PACKAGE} && \
    git checkout ${VERSION} && \
    make && \
    cp --archive minimap /usr/local/bin/  && \
    mkdir -p /usr/local/share/man/man1 && \
    cp minimap.1 /usr/local/share/man/man1/ && \
    mkdir -p /usr/local/share/doc/minimap  && \
    cp --archive LICENSE.txt README.md /usr/local/share/doc/minimap/

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
