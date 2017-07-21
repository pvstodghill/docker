# -*- default-generic -*-

FROM pvstodghill/ubuntu:xenial

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Package and version
ENV PACKAGE CuReSim
ENV VERSION 1.3

# Unpack the binaries to /opt/${PACKAGE}
ADD ${PACKAGE}${VERSION}.zip /opt/
ADD ${PACKAGE} /opt/
WORKDIR /opt
RUN unzip ${PACKAGE}${VERSION}.zip && \
    chmod +x ${PACKAGE} && \
    mv ${PACKAGE} ${PACKAGE}${VERSION} && \
    rm -f ${PACKAGE}${VERSION}.zip && \
    mv ${PACKAGE}${VERSION} ${PACKAGE}

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
ENV PATH /opt/${PACKAGE}:${PATH}
WORKDIR /mnt

# Default command - list the installed files
CMD find /opt/${PACKAGE} -type f | sort
