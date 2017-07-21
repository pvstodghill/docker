# -*- default-generic -*-

FROM pvstodghill/ubuntu:xenial

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Package and version
ENV PACKAGE pbsim
ENV VERSION 1.0.3

# Unpack the binaries to /opt/${PACKAGE}
ADD ${PACKAGE}-${VERSION}-Linux-amd64.tar.gz /opt/
WORKDIR /opt
RUN mv ${PACKAGE}-${VERSION}-Linux-amd64 ${PACKAGE}

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
ENV PATH /opt/${PACKAGE}/Linux-amd64/bin:${PATH}
WORKDIR /mnt

# Default command - list the installed files
CMD find /opt/${PACKAGE} -type f | sort
