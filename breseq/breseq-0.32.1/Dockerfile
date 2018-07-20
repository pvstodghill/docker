# -*- default-generic -*-

FROM debian:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@ars.usda.gov>

# Set up the build environment
ENV PACKAGE breseq
ENV VERSION 0.32.1
ENV BVERSION 2.3.4.1
ENV RUN_PACKAGES r-base-core python libsys-hostname-long-perl libunwind8

# Install required packages
RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    ${RUN_PACKAGES}

# Unpack and copy to ${DEST_DIR}

ENV DEST_DIR /usr/local
ENV BIN_DIR ${DEST_DIR}/bin
ENV LIB_DIR ${DEST_DIR}/lib/${PACKAGE}
ENV SHARE_DIR ${DEST_DIR}/share
ENV DOC_DIR ${SHARE_DIR}/doc/${PACKAGE}

# Install brseq binaries
ADD ${PACKAGE}-${VERSION}-Linux-x86_64.tar.gz /tmp/
WORKDIR /tmp/${PACKAGE}-${VERSION}-Linux-x86_64
RUN \
    mkdir -p ${DOC_DIR} ${LIB_DIR} ; \
    cp --archive bin/* ${BIN_DIR} ; \
    cp --archive documentation ${DOC_DIR} ; \
    cp --archive LICENSE ${DOC_DIR} ; \
    cp --archive README ${DOC_DIR} ; \
    cp --archive tests ${DOC_DIR} ; \
    chmod +x ${DOC_DIR}/tests/test.sh ; \
    cp --archive run_tests.sh ${DOC_DIR} ; \
    cp --archive share/* ${SHARE_DIR} ; \
    chmod -R go=u-w,-s /usr/local ; \
    : done
WORKDIR /root
RUN rm -rf /tmp/${PACKAGE}-${VERSION}

# Install bowtie2 binaries
ADD bowtie2-${BVERSION}-linux-x86_64.tar.gz /tmp/
WORKDIR /tmp/bowtie2-${BVERSION}-linux-x86_64
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
WORKDIR /root
RUN rm -rf /tmp/bowtie2-${BVERSION}

# Remove the build environment
RUN apt-get autoremove -y && apt-get clean

# Set up user environment
RUN useradd -d /mnt -M guest
USER guest
ENV HOME /mnt
WORKDIR /mnt

# Default command - list the installed files
CMD find /usr/local -type f | sort
