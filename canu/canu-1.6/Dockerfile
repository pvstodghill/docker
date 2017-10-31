# -*- default-generic -*-

FROM pvstodghill/ubuntu:xenial

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Package and version
ENV PACKAGE canu
ENV VERSION 1.6

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
        perl libfile-path-perl default-jre-headless gnuplot-nox

# Unpack the binaries to /opt/${PACKAGE}
ADD ${PACKAGE}-${VERSION}.Linux-amd64.tar.xz /opt/
WORKDIR /opt
RUN mv ${PACKAGE}-${VERSION} ${PACKAGE}

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
ENV PATH /opt/${PACKAGE}/Linux-amd64/bin:${PATH}
WORKDIR /mnt

# Default command - list the installed files
CMD find /opt/* -type f | sort
