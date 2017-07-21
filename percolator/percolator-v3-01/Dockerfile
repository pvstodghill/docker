# -*- default-generic -*-

FROM pvstodghill/ubuntu:xenial

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Package and version
ENV PACKAGE percolator
ENV VERSION v3-01

# Unpack the binaries to /opt/${PACKAGE}
WORKDIR /tmp
ADD *.deb /tmp/
RUN gdebi --n elude-${VERSION}-linux-amd64.deb && \
    gdebi --n percolator-converters-${VERSION}-linux-amd64.deb && \
    gdebi --n percolator-${VERSION}-linux-amd64.deb


# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
ENV PATH /opt/${PACKAGE}:${PATH}
WORKDIR /mnt

# Default command - list the installed files
CMD dpkg -L elude percolator-converters percolator | sort -u
