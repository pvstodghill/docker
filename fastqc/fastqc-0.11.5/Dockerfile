FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE fastqc
ENV VERSION 0.11.5
ENV RUN_PACKAGES libfindbin-libs-perl default-jre
ENV ZIP_DIR FastQC
ENV DEST_DIR /usr/local
ENV BIN_DIR ${DEST_DIR}/bin
ENV LIB_DIR ${DEST_DIR}/lib/${PACKAGE}
ENV DOC_DIR ${DEST_DIR}/share/doc/${PACKAGE}

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${RUN_PACKAGES}

# Unpack and copy to /usr/local
ADD FastQC /usr/local/lib/FastQC
ADD fastqc.bash /usr/local/bin/fastqc

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
WORKDIR /mnt

# Default command - list the installed files
CMD find /usr/local -type f | sort
