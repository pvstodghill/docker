# -*- default-generic -*-

FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE filiatrault2010
ENV VERSION 098198f
ENV BUILD_PACKAGES git
ENV RUN_PACKAGES perl gnuplot

# Install required packages
RUN apt-get update && \
    apt-get install -y ${BUILD_PACKAGES} ${RUN_PACKAGES}

# -----------------------------------------------------------------------

ENV DEST_DIR /usr/local
ENV BIN_DIR ${DEST_DIR}/bin
ENV LIB_DIR ${DEST_DIR}/lib/${PACKAGE}
ENV DOC_DIR ${DEST_DIR}/share/doc/${PACKAGE}

RUN cd /tmp && \
    git clone https://github.com/pvstodghill/${PACKAGE}.git && \
    cd ${PACKAGE} && \
    git checkout ${VERSION} && \
    cp --archive profiles2plots ${BIN_DIR} && \
    cp --archive profile2plot ${BIN_DIR} && \
    cp --archive sam-filter ${BIN_DIR} && \
    cp --archive sam-prefilter ${BIN_DIR} && \
    cp --archive sam2profiles ${BIN_DIR}

# -----------------------------------------------------------------------

# Remove the build environment
WORKDIR /root
RUN rm -rf /tmp/${PACKAGE} \
    && apt-get remove --yes --purge ${BUILD_PACKAGES} \
    && apt-get autoremove -y && apt-get clean

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
WORKDIR /mnt

# Default command - list the installed files
CMD find /usr/local -type f | sort
