# -*- default-generic -*-

FROM pvstodghill/ubuntu:xenial

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Package and version
ENV PACKAGE NanoSim
ENV VERSION 1.1.0

RUN apt-get update && apt-get install --yes last-align python-numpy

# Unpack the binaries to /opt/${PACKAGE}
ADD ${PACKAGE}-${VERSION}.tar.gz /opt/
WORKDIR /opt
RUN mv ${PACKAGE}-${VERSION} ${PACKAGE}

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
ENV PATH /opt/${PACKAGE}/src:${PATH}
WORKDIR /mnt

# Default command - list the installed files
CMD find /opt/${PACKAGE} -type f | sort
