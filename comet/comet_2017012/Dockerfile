# -*- default-generic -*-

FROM pvstodghill/ubuntu:xenial

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Package and version
ENV PACKAGE comet
ENV VERSION 2017012

# Unpack the binaries to /opt/${PACKAGE}
RUN mkdir -p /opt/${PACKAGE}
ADD comet.exe /opt/${PACKAGE}

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
ENV PATH /opt/${PACKAGE}:${PATH}
WORKDIR /mnt

# Default command - list the installed files
CMD find /opt/${PACKAGE} -type f | sort
