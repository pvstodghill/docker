# -*- default-generic -*-

FROM ubuntu:14.04

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE mauve
ENV VERSION 2015-02-13
ENV BUILD_PACKAGES ""
ENV RUN_PACKAGES default-jre

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${BUILD_PACKAGES} ${RUN_PACKAGES}

# Unpack and copy to ${DEST_DIR}

ENV DEST_DIR /usr/local
ENV BIN_DIR ${DEST_DIR}/bin
ENV LIB_DIR ${DEST_DIR}/lib/${PACKAGE}
ENV DOC_DIR ${DEST_DIR}/share/doc/${PACKAGE}

ADD ${PACKAGE}_linux_snapshot_${VERSION}.tar.gz /tmp/
WORKDIR /tmp/${PACKAGE}_snapshot_${VERSION}

RUN \
    mkdir -p ${LIB_DIR} ${DOC_DIR} ; \
    cp --archive COPYING  ChangeLog.html README ${DOC_DIR} ; \
    cp --archive linux-x64/mauveAligner  linux-x64/progressiveMauve ${BIN_DIR} ; \
    cp --archive Mauve Mauve.jar ext ${LIB_DIR} ; \
    ln -s ../lib/${PACKAGE}/Mauve ${BIN_DIR} ; \
    : done

# Remove the build environment
WORKDIR /root
RUN rm -rf /tmp/${PACKAGE}-${VERSION} \
    && apt-get remove --yes --purge ${BUILD_PACKAGES} \
    && apt-get autoremove -y && apt-get clean

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
WORKDIR /mnt

# Default command - list the installed files
CMD find /usr/local -type f | sort
