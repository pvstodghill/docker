# -*- default-generic -*-

FROM ubuntu:xenial

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Install required packages
ENV BUILD_PACKAGES unzip
ENV RUN_PACKAGES default-jre
RUN \
    sed -i'' 's/archive\.ubuntu\.com/mirrors.rit.edu/' /etc/apt/sources.list && \
    sed -i'' 's/security\.ubuntu\.com/mirrors.rit.edu/' /etc/apt/sources.list && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && apt-get update && \
    apt-get install --yes ${BUILD_PACKAGES} ${RUN_PACKAGES}

# Unpack the binaries to /opt/${PACKAGE}
ENV PACKAGE Trimmomatic
ENV VERSION 0.38
ADD ${PACKAGE}-${VERSION}.zip /opt/
WORKDIR /opt
RUN unzip ${PACKAGE}-${VERSION}.zip && \
    rm -f ${PACKAGE}-${VERSION}.zip && \
    mv ${PACKAGE}-${VERSION} ${PACKAGE}
RUN mv ${PACKAGE}/trimmomatic-*.jar ${PACKAGE}/trimmomatic.jar

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
