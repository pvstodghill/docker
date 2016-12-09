FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE bowtie2
ENV VERSION 2.2.9
ENV RUN_PACKAGES python
ENV DEST_DIR /usr/local
ENV BIN_DIR ${DEST_DIR}/bin
ENV LIB_DIR ${DEST_DIR}/lib/${PACKAGE}
ENV DOC_DIR ${DEST_DIR}/share/doc/${PACKAGE}

# Install required packages
RUN apt-get update && \
    apt-get install --yes \
    ${RUN_PACKAGES}

# Unpack and copy to /usr/local
ADD bowtie2-${VERSION} /tmp/bowtie2-${VERSION}
WORKDIR /tmp/bowtie2-${VERSION}
RUN \
    mkdir -p ${DOC_DIR} ; \
    cp --archive AUTHORS ${DOC_DIR} ; \
    cp --archive LICENSE  ${DOC_DIR} ; \
    cp --archive MANUAL  ${DOC_DIR} ; \
    cp --archive MANUAL.markdown  ${DOC_DIR} ; \
    cp --archive NEWS  ${DOC_DIR} ; \
    cp --archive TUTORIAL  ${DOC_DIR} ; \
    cp --archive VERSION  ${DOC_DIR} ; \
    cp --archive bowtie2 ${BIN_DIR} ; \
    cp --archive bowtie2-align-l ${BIN_DIR} ; \
    cp --archive bowtie2-align-l-debug ${BIN_DIR} ; \
    cp --archive bowtie2-align-s ${BIN_DIR} ; \
    cp --archive bowtie2-align-s-debug ${BIN_DIR} ; \
    cp --archive bowtie2-build ${BIN_DIR} ; \
    cp --archive bowtie2-build-l ${BIN_DIR} ; \
    cp --archive bowtie2-build-l-debug ${BIN_DIR} ; \
    cp --archive bowtie2-build-s ${BIN_DIR} ; \
    cp --archive bowtie2-build-s-debug ${BIN_DIR} ; \
    cp --archive bowtie2-inspect ${BIN_DIR} ; \
    cp --archive bowtie2-inspect-l ${BIN_DIR} ; \
    cp --archive bowtie2-inspect-l-debug ${BIN_DIR} ; \
    cp --archive bowtie2-inspect-s ${BIN_DIR} ; \
    cp --archive bowtie2-inspect-s-debug ${BIN_DIR} ; \
    cp --archive doc  ${DOC_DIR} ; \
    cp --archive example  ${DOC_DIR} ; \
    cp --archive scripts  ${DOC_DIR} ; \
    : done

# Remove the build environment
WORKDIR /root
RUN rm -rf /tmp/bowtie2-${VERSION}

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
WORKDIR /mnt

# Default command - list the installed files
CMD find /usr/local -type f | sort
