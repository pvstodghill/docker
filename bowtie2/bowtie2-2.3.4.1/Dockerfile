# -*- default-generic -*-

FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Package and version
ENV PACKAGE bowtie2
ENV VERSION 2.3.4.1
ENV BUILD_PACKAGES unzip
ENV RUN_PACKAGES python libsys-hostname-long-perl

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${BUILD_PACKAGES} ${RUN_PACKAGES}

# Unpack the binaries to /opt/${PACKAGE}
ADD ${PACKAGE}-${VERSION}-linux-x86_64.zip /opt/
WORKDIR /opt
RUN unzip ${PACKAGE}-${VERSION}-linux-x86_64.zip && \
    rm -f ${PACKAGE}-${VERSION}-linux-x86_64.zip && \
    mv ${PACKAGE}-${VERSION}-linux-x86_64 ${PACKAGE}

# Remove the build environment
WORKDIR /root
RUN rm -rf /tmp/${PACKAGE} \
    && apt-get remove --yes --purge ${BUILD_PACKAGES} \
    && apt-get autoremove -y && apt-get clean

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
ENV PATH /opt/${PACKAGE}:${PATH}
WORKDIR /mnt

# Default command - list the installed files
CMD find /opt/* -type f | sort
