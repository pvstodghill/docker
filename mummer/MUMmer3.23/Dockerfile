# -*- default-generic -*-

FIXME

FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE FIXME
ENV VERSION FIXME
ENV BUILD_PACKAGES build-essential 
ENV RUN_PACKAGES ""

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${BUILD_PACKAGES} ${RUN_PACKAGES}


# Unpack and build
ADD ${PACKAGE}-${VERSION}.tar.gz /tmp/
WORKDIR /tmp/${PACKAGE}-${VERSION}

RUN exit 1 # Remove before running final version

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
