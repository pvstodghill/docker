# -*- default-generic -*-

FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Install required packages
ENV RUN_PACKAGES default-jre-headless
RUN apt-get update && \
    apt-get install --yes \
    ${RUN_PACKAGES}

# Unpack the binaries to /opt/${PACKAGE}
ENV PACKAGE pilon
ENV VERSION 1.22
ADD ${PACKAGE}-${VERSION}.jar /opt/${PACKAGE}/${PACKAGE}.jar
ADD ${PACKAGE}.bash /opt/${PACKAGE}/${PACKAGE}

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
ENV PATH /opt/${PACKAGE}:${PATH}
WORKDIR /mnt

# Default command - list the installed files
CMD find /opt/* -type f | sort
