# -*- default-generic -*-

FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV BUILD_PACKAGES build-essential zlib1g-dev
ENV RUN_PACKAGES zlib1g

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${BUILD_PACKAGES} ${RUN_PACKAGES}


# Unpack and build
ENV PACKAGE bwa
ENV VERSION 0.7.17
ADD ${PACKAGE}-${VERSION}.tar.bz2 /tmp/
WORKDIR /tmp/${PACKAGE}-${VERSION}

RUN make \
    && install -d /usr/local/bin \
    && install -p bwa qualfa2fq.pl xa2multi.pl /usr/local/bin \
    && install -d /usr/local/share/man/man1 \
    && install -p bwa.1 /usr/local/share/man/man1 \
    && install -d /usr/local/share/doc/bwa \
    && install -p COPYING ChangeLog NEWS.md README.md README-alt.md /usr/local/share/doc/bwa

# Remove the build environment
WORKDIR /root
RUN rm -rf /tmp/${PACKAGE}-${VERSION} \
    && apt-get remove --yes --purge ${BUILD_PACKAGES} \
    && apt-get autoremove -y && apt-get clean

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
ENV PATH /opt/${PACKAGE}:${PATH}
WORKDIR /mnt

# Default command - list the installed files
CMD find /usr/local -type f | sort
