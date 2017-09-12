# -*- default-generic -*-

FROM pvstodghill/ubuntu:xenial

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Package and version
ENV PACKAGE clustalo
ENV VERSION 1.2.4

# Unpack the binaries to /opt/${PACKAGE}
ADD ${PACKAGE}-${VERSION}-Ubuntu-x86_64 /opt/
WORKDIR /opt
RUN \
    mkdir ${PACKAGE} && \
    mv ${PACKAGE}-${VERSION}-Ubuntu-x86_64 ${PACKAGE}/${PACKAGE} && \
    chmod +x ${PACKAGE}/${PACKAGE}

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
ENV PATH /opt/${PACKAGE}:${PATH}
WORKDIR /mnt

# Default command - list the installed files
CMD find /opt/* -type f | sort
