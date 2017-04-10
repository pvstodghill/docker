# -*- default-generic -*-

FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE ncbi-blast
ENV VERSION 2.6.0plus
ENV xVERSION 2.6.0+
ENV BUILD_PACKAGES ""
ENV RUN_PACKAGES "libidn11 libpod-escapes-perl perl-doc liblist-moreutils-perl"

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${BUILD_PACKAGES} ${RUN_PACKAGES}

# Unpack and copy to ${DEST_DIR}

ENV DEST_DIR /usr/local
ENV BIN_DIR ${DEST_DIR}/bin
ENV LIB_DIR ${DEST_DIR}/lib/${PACKAGE}
ENV DOC_DIR ${DEST_DIR}/share/doc/${PACKAGE}

ADD ${PACKAGE}-${xVERSION}-x64-linux.tar.gz /tmp/
WORKDIR /tmp/${PACKAGE}-${xVERSION}

RUN \
    mkdir -p ${DOC_DIR} ${LIB_DIR} ; \
    cp --archive bin/* ${BIN_DIR} ; \
    cp --archive doc/* ${DOC_DIR} ; \
    cp --archive ChangeLog  LICENSE  README ncbi_package_info ${DOC_DIR} ; \
    : done

# Remove the build environment
WORKDIR /root
RUN rm -rf /tmp/${PACKAGE}-${xVERSION} \
    && apt-get remove --yes --purge ${BUILD_PACKAGES} \
    && apt-get autoremove -y && apt-get clean

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
WORKDIR /mnt

# Default command - list the installed files
CMD find /usr/local -type f | sort
