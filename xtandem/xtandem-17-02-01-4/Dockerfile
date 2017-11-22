# -*- default-generic -*-

FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Install required packages
ENV BUILD_PACKAGES unzip
ENV RUN_PACKAGES ""
RUN rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get update && \
    apt-get install --yes ${BUILD_PACKAGES} ${RUN_PACKAGES} && \
    : done

# Unpack the binaries to /opt/${PACKAGE}
ENV PACKAGE xtandem
ENV VERSION 17-02-01-4
ADD tandem-linux-${VERSION}.zip /opt/
WORKDIR /opt
RUN unzip tandem-linux-${VERSION}.zip && \
    rm -f tandem-linux-${VERSION}.zip && \
    mv tandem-linux-${VERSION} ${PACKAGE} && \
    chmod +x ${PACKAGE}/bin/static_link_ubuntu/*.exe

# Remove the build environment
WORKDIR /root
RUN rm -rf /tmp/${PACKAGE} \
    && apt-get remove --yes --purge ${BUILD_PACKAGES} \
    && apt-get autoremove -y && apt-get clean

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
ENV PATH /opt/${PACKAGE}/bin/static_link_ubuntu:${PATH}
WORKDIR /mnt

# Default command - list the installed files
CMD find /opt/* -type f | sort
